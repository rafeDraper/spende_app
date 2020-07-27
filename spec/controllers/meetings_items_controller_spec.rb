RSpec.describe MeetingsItemsController, type: :controller do
  describe '#new' do
    let(:user) { FactoryBot.create(:user) }
    let(:item) { FactoryBot.create(:meetings_item) }

    context 'authenticated' do
      it 'responds successfully' do
        sign_in(user)
        get :new, params: { meetings_list_id: item.id }
        expect(response).to render_template(:new)
      end
    end

    context 'un-authenticated' do
      it 'fails and redirects to sign_in' do
        get :new, params: { meetings_list_id: item.id }
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe '#create' do
    let(:user) { FactoryBot.create(:user) }
    let(:list) { FactoryBot.create(:meetings_list) }

    context 'authenticated' do
      it 'with valid input' do
        item_params = FactoryBot.attributes_for(:meetings_item)
        sign_in(user)
        expect do
          post(:create, params: { meetings_item: item_params,
                                  meetings_list_id: list.id })
        end.to change(MeetingsItem, :count).by(1)
      end

      it 'with invalid input' do
        item_params = FactoryBot.attributes_for(:meetings_item, :invalid_item)
        sign_in(user)
        post(:create, params: { meetings_item: item_params,
                                meetings_list_id: list.id })
        expect(response).to render_template(:new)
        expect(response).to have_http_status('200')
        expect do
          post(:create, params: { meetings_item: item_params,
                                  meetings_list_id: list.id })
        end.to_not change(MeetingsItem, :count)
      end
    end

    context 'un-authenticated' do
      it 'fails and redirects to sign_in' do
        item_params = FactoryBot.attributes_for(:meetings_item, :invalid_item)
        post(:create, params: { meetings_item: item_params,
                                meetings_list_id: list.id })
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe '#delete' do
    context 'authenticated' do
      let(:user) { FactoryBot.create(:user, :admin) }
      let(:item) { FactoryBot.create(:meetings_item) }
      # let! is not LAZY!

      it 'deletes an item' do
        sign_in(user)
        expect do
          delete(:destroy, params: { id: item.id,
                                     meetings_list_id: item.meetings_list.id })
        end.to_not change(MeetingsItem, :count)
        expect(flash[:notice]).to match(/Item erfolgreich vernichtet./)
        expect(response).to redirect_to("/meetings_lists/#{item.meetings_list.id}")
      end
    end

    context 'authenticated, but not admin' do
      let(:user) { FactoryBot.create(:user) }
      let(:item) { FactoryBot.create(:meetings_item) }

      it 'fails' do
        sign_in(user)
        item
        delete(:destroy, params: { id: item.id, meetings_list_id: item.meetings_list.id })
        expect(MeetingsItem.count).to eq(1)
        expect(flash[:alert]).to match(/Benutzer ist nicht Autorisiert/)
      end
    end
  end

  describe '#edit' do
    context 'authenticated' do
      render_views
      let(:user) { FactoryBot.create(:user, :admin) }
      let(:item) { FactoryBot.create(:meetings_item) }

      it 'edits an item' do
        sign_in(user)
        item_params = FactoryBot.attributes_for(:meetings_item, reason: 'test reason')
        patch(:update, params: { meetings_list_id: item.meetings_list.id,
                                 id: item.id,
                                 meetings_item: item_params })
        expect(item.reload.reason).to eq('test reason')
        expect(flash[:notice]).to match(/Item erfolgreich aktualisiert/)
      end

      it 'fails, with wrong params' do
        sign_in(user)
        item_params = FactoryBot.attributes_for(:meetings_item, reason: nil)
        patch(:update, params: { meetings_list_id: item.meetings_list.id,
                                 id: item.id,
                                 meetings_item: item_params })
        expect(response).to render_template(:edit)
        expect(response.body).to match(/Reason muss ausgefüllt werden/)
      end
    end
  end

  describe '#complete' do
    context 'authenticated' do
      let(:user) { FactoryBot.create(:user, :admin) }
      let(:item) { FactoryBot.create(:meetings_item) }
      it 'completes an item' do
        sign_in(user)
        item_params = FactoryBot.attributes_for(:meetings_item)
        patch(:complete, params: { meetings_list_id: item.meetings_list.id,
                                   id: item.id,
                                   meetings_item: item_params,
                                   completeted_at: Time.now,
                                   updated_at: Time.now })
        expect(item.reload.completed?).to eq(true)
        expect(flash[:notice]).to match(/Aufgabe erledigt/)
      end
    end
  end
end
