require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:veterinarian) { FactoryBot.create(:veterinarian) }
  let!(:farrier) { FactoryBot.create(:farrier) }
  let!(:horse) { FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier) }
  let!(:note) { FactoryBot.create(:note, horse: horse)}

  describe 'GET #show' do
    context 'when user is logged in as admin' do
      with :user
      before do
        sign_in user
        get :show, params: { id: note.id}
      end
      it 'assigns the requested note to @note' do
        get :show, params: { id: note.id }
        assigns(:note).should eq(note)
      end
    end

      it "renders the #show view" do
        get :show, params: { id: note.id}
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

        it "note should be new" do
        Note.stub(:new).and_return(note)

        get :new

        assigns(:note).should == note
      end
    end
  end

    describe 'DELETE destroy' do
    before :each do
      sign_in user
      @note = :note
    end

    it "deletes the note" do
      expect{
        delete :destroy, params: { id: note.id }
      }.to change(Note,:count).by(-1)
    end

    it "redirects to notes#index" do
      delete :destroy, params: { id: note.id }
      response.should redirect_to new_note_path
    end
  end
end
