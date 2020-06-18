RSpec.describe MeetingsItemsController, type: :controller do
  describe '#new' do
    context 'authenticated user' do
      login_user
      before do
        @item = FactoryBot.create(:meetings_item)
        @list = FactoryBot.create(:meetings_list)
      end

      it 'responds successfully' do
        get :new, params: { meetings_list_id: @list.id }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'authenticated admin' do
      login_admin
      before do
        @item = FactoryBot.create(:meetings_item)
        @list = FactoryBot.create(:meetings_list)
      end
      it 'succeed' do
        post :create, params: { meetings_item: @list.meetings_items.create(FactoryBot.attributes_for(:meetings_item)) }
        expect(response).to redirect_to(meetings_lists_path)
      end
    end
  end
end
