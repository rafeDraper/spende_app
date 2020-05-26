RSpec.describe MeetingsListsController, type: :controller do
  let(:meeting) { create(:meetings_list) }

  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end

    it 'populates an array of meetings' do
      get(:index)
      expect(assigns(:meetings_lists)).to eq([meeting])
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
      login_editor
      it 'should not allow and redirect to the root' do
        get(:new)
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when user is visitor' do
      login_user
      it 'should not allow and redirect to the root' do
        get(:new)
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET #show' do
    context 'when user registered' do
      login_user
      it 'renders the :show template' do
        get(:show, params: { id: meeting.id })
        expect(response.status).to eq(200)
      end
    end

    context 'when user unregistered' do
      it 'redirects to the user sign in page'
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
      it 'should save the new meeting list with proper attributes' do
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
