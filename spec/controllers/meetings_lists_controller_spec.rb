RSpec.describe MeetingsListsController, type: :controller do
  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    context 'when user is administrator' do
      login_admin
      it 'should display the #new page' do 
        get(:new)
        expect(response).to render_template(:new)
      end
    end

    context 'when user is editor' do
      it 'should display the #new page'
    end

    context 'when user is visitor' do
      it 'should ask for registration or logging in' do
        get(:new)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when user registered' do
      it 'renders the meetings_lists#show page' do
      end
    end

    context 'when user unregistered' do
      it 'redirects to index with a warning' do
      end
    end
  end

  describe 'GET #edit' do
    context 'when user registered' do
      it 'renders the meetings_lists#edit page' do
      end
    end

    context 'when user unregistered' do
      it 'redirects to index with a warning' do
      end
    end
  end

  describe 'POST #create' do
    context 'when user is registered' do
      it 'should save the new meeting list' do
      end
      it 'should redirect to meetings_lists#index page' do
      end
    end

    context 'when user unregistered' do
      it 'is unavailable to unauthorized users' do
      end
    end
  end
end
