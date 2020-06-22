RSpec.describe MeetingsItemsController, type: :controller do
  before(:each) do
    @item = FactoryBot.create(:meetings_item)
    @list = FactoryBot.create(:meetings_list)
  end

  describe '#new' do
    context 'authenticated user' do
      login_user

      it 'responds successfully' do
        get :new, params: { meetings_list_id: @list.id }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'authenticated admin' do
      login_admin

      it 'with valid input' do
        post :create, params: { meetings_item: {
          date: @item.date,
          amount: @item.amount,
          reason: @item.reason
        }, meetings_list_id: @list.id }
        expect(response).to redirect_to("/meetings_lists/#{@list.id}")
      end

      it 'with invalid input' do
        post(:create, params: { meetings_item: {
               date: nil,
               amount: @item.amount,
               reason: @item.reason
             }, meetings_list_id: @list.id })
        expect(response).to render_template(:new)
        expect(response).to have_http_status('200')
      end
    end
  end

  describe '#delete' do
    context 'authenticated admin' do
      login_admin
      it 'deletes an item' do
        expect do
          delete(:destroy, params: { id: @item.id, meetings_list_id: @item.id })
        end.to change(MeetingsItem, :count).by(-1)
      end
    end
  end
end
