require 'rails_helper'

RSpec.describe HorsesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:farrier) { FactoryBot.create(:farrier) }
  let!(:veterinarian) { FactoryBot.create(:veterinarian) }
  let!(:horse) { FactoryBot.create(:horse, user: user, farrier: farrier, veterinarian: veterinarian) }

  describe 'GET #show' do
    context 'when user is logged in as admin' do
      with :user
      before do
        sign_in user
        get :show, params: { id: horse.id}
      end
      it 'assigns the requested horse to @horse' do
        get :show, params: { id: horse.id }
        assigns(:horse).should eq(horse)
      end
    end

      it "renders the #show view" do
        get :show, params: { id: horse.id}
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

          it "horse should be new" do
          Horse.stub(:new).and_return(horse)

          get :new

          assigns(:horse).should == horse
        end
      end
    end

      describe 'DELETE destroy' do
      before :each do
        sign_in user
        @horse = :horse
      end

      it "deletes the horse" do
        expect{
          delete :destroy, params: { id: horse.id }
        }.to change(Horse,:count).by(-1)
      end

      it "redirects to horses#index" do
        delete :destroy, params: { id: horse.id }
        response.should redirect_to new_horse_path
      end
    end
  end
