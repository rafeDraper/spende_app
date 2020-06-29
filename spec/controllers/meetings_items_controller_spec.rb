RSpec.describe MeetingsItemsController, type: :controller do
  describe '#new' do
    context 'authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:meetings_item)
      end

      it 'responds successfully' do
        get :new, params: { meetings_list_id: @item.id }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'authenticated admin' do
      before do
        @user = FactoryBot.create(:user, :admin)
        @item = FactoryBot.create(:meetings_item)
        @list = FactoryBot.create(:meetings_list)
      end

      it 'with valid input' do
        item_params = FactoryBot.attributes_for(:meetings_item)
        sign_in(@user)
        expect do
          post(:create, params: { meetings_item: item_params,
                                  meetings_list_id: @list.id })
        end.to change(MeetingsItem, :count).by(1)
      end

      it 'with invalid input' do
        item_params = FactoryBot.attributes_for(:meetings_item, :invalid_item)
        sign_in(@user)
        post(:create, params: { meetings_item: item_params,
                                meetings_list_id: @list.id })
        expect(response).to render_template(:new)
        expect(response).to have_http_status('200')
        expect do
          post(:create, params: { meetings_item: item_params,
                                  meetings_list_id: @list.id })
        end.to_not change(MeetingsItem, :count)
      end
    end
  end

  describe '#delete' do
    context 'authenticated admin' do
      before do
        @user = FactoryBot.create(:user, :admin)
        @item = FactoryBot.create(:meetings_item)
        @list = FactoryBot.create(:meetings_list)
      end
      it 'deletes an item' do
        sign_in(@user)
        expect do
          delete(:destroy, params: { id: @item.id, meetings_list_id: @item.id })
        end.to change(MeetingsItem, :count).by(-1)
      end
    end

    context 'unauthenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:meetings_item)
      end

      it 'fails to delete' do
        expect do
          delete(:destroy, params: { id: @item.id,
                                     meetings_list_id: @item.id })
        end.to_not change(MeetingsItem, :count)
      end
    end
  end
end
