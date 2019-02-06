require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:veterinarian) { FactoryBot.create(:veterinarian) }
  let!(:farrier) { FactoryBot.create(:farrier) }
  let!(:horse) { FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier) }
  let!(:event) { FactoryBot.create(:event, date: 20170901, horse: horse)}

  describe 'GET #show' do
    it 'assigns the requested event to @event' do
      get :show, params: { id: event.id }
      assigns(:event).should eq(event)
    end
  end

    it "renders the #show view" do
      get :show, params: { id: event.id}
      response.should render_template :show
    end

    describe "GET #new" do
      context 'when user is logged in as admin' do
        with :user
        before do
          sign_in user
          get :new
        end

          it "event should be new" do
          Event.stub(:new).and_return(event)

          get :new

          assigns(:event).should == event
        end
      end
    end

      describe 'DELETE destroy' do
      before :each do
        sign_in user
        @event = :event
      end

      it "deletes the event" do
        expect{
          delete :destroy, params: { id: event.id }
        }.to change(Event,:count).by(-1)
      end

      it "redirects to events#index" do
        delete :destroy, params: { id: event.id }
        response.should redirect_to new_event_path
      end
    end
  end
