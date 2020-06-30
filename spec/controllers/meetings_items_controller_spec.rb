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
    let(:user) { FactoryBot.create(:user) }
    let(:item) { FactoryBot.create(:meetings_item) }

    context 'authenticated' do
      it 'deletes an item' do
        sign_in(user)
        expect{
          delete(:destroy, params: { id: item, meetings_list_id: item })
        }.to change(MeetingsItem, :count).to(-1)
        expect(flash[:notice]).to match(/Listenelement gelöscht./)
      end
    end
  end
end
