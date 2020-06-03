RSpec.describe MeetingsListsController, type: :controller do
  let(:meeting) { create(:meetings_list) }

  describe 'GET #index' do
    it 'renders #index' do
      get(:index)
      expect(response).to render_template(:index)
    end

    it 'assigns meeting list to @meetis_list' do
      get(:index)
      expect(assigns(:meetings_lists)).to include(meeting)
    end
  end

  describe 'GET #new' do
    context 'when user is administrator' do
      before(login_admin) do
        it 'should display the #new page' do
          get(:new)
          expect(response).to render_template(:new)
        end
      end
    end

    context 'when user is editor' do
      before(login_editor) do
        it 'should not allow and redirect to the root' do
          get(:new)
          expect(response).to redirect_to(root_url)
        end
      end
    end

    context 'when user is visitor' do
      before(login_user) do
        it 'should not allow and redirect to the root' do
          get(:new)
          expect(response).to redirect_to(root_url)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'when user registered' do
      before(login_user) do
        it 'renders the :show template' do
          get(:show, params: { id: meeting.id })
          expect(response.status).to eq(200)
          expect(response).to render_template(:show)
        end
      end
    end

    context 'when user unregistered' do
      it 'redirects to the user sign in page' do
        get(:show, params: { id: meeting.id })
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user registered' do
      before(login_user) do
        it 'renders the meetings_lists#edit page' do
          get(:edit, params: { id: meeting.id })
          expect(response.status).to eq(200)
          expect(response).to render_template(:edit)
        end
      end
    end

    context 'when user unregistered' do
      it 'redirects to index with a warning' do
        get(:edit, params: { id: meeting.id })
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is registered' do
      before(login_user) do
        it 'should save the new meeting list with proper attributes' do
          expect do
            post(:create, params: { meetings_list: {
                   title: meeting.title,
                   responsible: meeting.responsible
                 } })
          end.to change { MeetingsList.count }.by(1)
        end
        it 'should redirect to meetings_lists#index page' do
        end
      end
    end

    context 'when user unregistered' do
      it 'is unavailable to unauthorized users' do
      end
    end
  end
end
