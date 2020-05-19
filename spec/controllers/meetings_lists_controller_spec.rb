RSpec.describe MeetingsListsController, type: :controller do
  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it 'renders #new' do
      get(:new)
      expect(response).to render_template(:new)  
    end
  end
end
