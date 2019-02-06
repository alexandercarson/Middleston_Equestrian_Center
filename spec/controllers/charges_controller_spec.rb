require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:veterinarian) { FactoryBot.create(:veterinarian) }
  let!(:farrier) { FactoryBot.create(:farrier) }
  let!(:horse) { FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier) }
  let!(:charge) { FactoryBot.create(:charge, date: 20170901, horse: horse)}

  describe 'GET #show' do
    context 'when user is logged in as admin' do
      with :user
      before do
        sign_in user
        get :show, params: { id: charge.id}
      end
      it 'assigns the requested charge to @charge' do
        get :show, params: { id: charge.id }
        assigns(:charge).should eq(charge)
      end
    end

      it "renders the #show view" do
        get :show, params: { id: charge.id}
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

        it "charge should be new" do
        Charge.stub(:new).and_return(charge)

        get :new

        assigns(:charge).should == charge
      end
    end
  end

    describe 'DELETE destroy' do
    before :each do
      sign_in user
      @charge = :charge
    end

    it "deletes the charge" do
      expect{
        delete :destroy, params: { id: charge.id }
      }.to change(Charge,:count).by(-1)
    end

    it "redirects to charges#index" do
      delete :destroy, params: { id: charge.id }
      response.should redirect_to new_charge_path
    end
  end
end
