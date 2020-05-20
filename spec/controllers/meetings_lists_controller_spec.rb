RSpec.describe MeetingsListsController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  xdescribe 'GET #new' do

    it 'renders #new' do
      get(:new)
      expect(response).to render_template(:new)
    end
  end
end
