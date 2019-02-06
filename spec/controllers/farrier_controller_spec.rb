require 'rails_helper'

RSpec.describe FarriersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:farrier) { FactoryBot.create(:farrier) }

  describe "GET #index" do
    context 'when user is logged in as admin' do
      with :user
      before do
        sign_in user
        get :index
      end
      it "populates an array of farriers" do
        get :index
        assigns(:farriers).should eq([farrier])
      end

      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end
  end

  describe 'GET #show' do
    context 'when user is logged in as admin' do
      with :user
      before do
        sign_in user
        get :show, params: { id: farrier.id }
      end
      it 'assigns the requested farrier to @farrier' do
        get :show, params: { id: farrier.id }
        assigns(:farrier).should eq(farrier)
      end
    end

      it "renders the #show view" do
        get :show, params: { id: farrier.id}
        response.should render_template :show
      end
    end

    describe "GET #new" do
      context 'when user is logged in as admin' do
        with :user
        before do
          sign_in user
          get :new
        end

          it "farrier should be new" do
          Farrier.stub(:new).and_return(farrier)

          get :new

          assigns(:farrier).should == farrier
        end
      end
    end

      describe 'DELETE destroy' do
      before :each do
        sign_in user
        @farrier = :farrier
      end

      it "deletes the farrier" do
        expect{
          delete :destroy, params: { id: farrier.id }
        }.to change(Farrier,:count).by(-1)
      end

      it "redirects to farriers#index" do
        delete :destroy, params: { id: farrier.id }
        response.should redirect_to new_farrier_path
      end
    end
  end
