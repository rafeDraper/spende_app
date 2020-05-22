RSpec.describe MeetingsListsController, type: :controller do
  render_views

  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  skip describe 'GET #new' do
    it 'renders #new' do
      sign_in(FactoryBot.create(:user))
      get(:new)
      expect(response).to render_template(:new)
    end
  end
end
