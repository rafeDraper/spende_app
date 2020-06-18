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
        post :create, params: { meetings_item: {
          date: @item.date,
          amount: @item.amount,
          reason: @item.reason
        }, meetings_list_id: @list.id }
        expect(response).to redirect_to("/meetings_lists/#{@list.id}")
      end
    end
  end
end
