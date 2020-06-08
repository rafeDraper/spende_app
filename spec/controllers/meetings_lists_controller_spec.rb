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
      login_admin
      it 'should display the #new page' do
        get(:new)
        expect(response).to render_template(:new)
      end

      it 'should initiate instance of @meetings_list' do
        get(:new)
        expect(assigns(:meetings_list)).to be_a_new(MeetingsList)
      end
    end

    context 'when user is editor' do
      login_editor
      it 'should not allow and redirect to the root' do
        get(:new)
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when loged in but is a user' do
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
      render_views
      it 'renders the :show template' do
        get(:show, params: { id: meeting.id })
        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
        expect(response.body).to match(/<div class="total">total: €0,00/)
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
      login_user
      it 'renders the meetings_lists#edit page' do
        get(:edit, params: { id: meeting.id })
        expect(response.status).to eq(200)
        expect(response).to render_template(:edit)
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
      login_user
      render_views
      it 'should save the new meeting list with proper attributes' do
        expect do
          post(:create, params: { meetings_list:
                                  FactoryBot.attributes_for(:meetings_list) })
        end.to change { MeetingsList.count }.by(1)
      end
      it 'should redirect to the latest meeting list' do
        post(:create, params: { meetings_list:
                                  FactoryBot.attributes_for(:meetings_list) })
        expect(response).to redirect_to(MeetingsList.first)
      end

      it 'should fail with invalid parameters' do
        post(:create, params: { meetings_list:
                                FactoryBot.attributes_for(:invalid_meeting) })
        expect(response).to render_template(:new)
        expect(response.body).to match(/Title muss ausgefüllt werden/)
      end
    end
  end

  describe 'PUT #update,' do
    before(:example) do
      @meeting_list_update = create(:meetings_list,
                                    title: 'Edited Title',
                                    responsible: 'Edited Responsible')
    end

    context 'with valid attributes,' do
      login_user
      it 'locates the requested @meetings_list_update' do
        put(:update, params: { id: @meeting_list_update,
                               meetings_list:
                                FactoryBot.attributes_for(:meetings_list) })
        expect(assigns(:meetings_list)).to eq(@meeting_list_update)
      end

      it 'changes @meetings_list_update attributes' do
        put(:update, params: { id: @meeting_list_update,
                               meetings_list:
                                FactoryBot.attributes_for(:meetings_list, title: 'Edited', responsible: 'Editor') })
        @meeting_list_update.reload
        expect(@meeting_list_update.title).to eq('Edited')
        expect(@meeting_list_update.responsible).to eq('Editor')
      end
    end

    context 'invalid attributes' do
      login_user
      it 'locates the requested @meetings_list_update' do
        put(:update, params: { id: @meeting_list_update,
                               meetings_list:
                                FactoryBot.attributes_for(:invalid_meeting) })
        expect(assigns(:meetings_list)).to eq(@meeting_list_update)
      end

      it 'does not changes @meetings_list_update attributes' do
        put(:update, params: { id: @meeting_list_update,
                               meetings_list:
                                FactoryBot.attributes_for(:meetings_list, title: nil, responsible: 'Editor') })
        @meeting_list_update.reload
        expect(@meeting_list_update.title).to eq('Edited Title')
        expect(@meeting_list_update.responsible).to_not eq('Editor')
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:example) do
      @meeting_list_delete = create(:meetings_list)
    end

    context 'when user is an administrator' do
      login_admin
      it 'deletes the meetings_list' do
        expect do
          delete(:destroy, params: { id: @meeting_list_delete })
        end.to change(MeetingsList, :count).by(-1)
      end
    end

    context 'when user is not authorized' do
      it 'do not allow action' do
        expect do
          delete(:destroy, params: { id: @meeting_list_delete })
        end.to change(MeetingsList, :count).by(0)
      end
    end
  end
end
