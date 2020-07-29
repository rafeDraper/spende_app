RSpec.describe UsersController, type: :controller do
  

  describe '#index' do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }
    context 'authenticated' do
      it 'will success if admin' do
        sign_in(admin)
        get :index
        expect(response).to render_template(:index)
        expect(response).to have_http_status('200')
      end

      it 'will fail is not admin' do
        sign_in(user)
        get :index
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status('302')
      end
    end
  end

  describe '#show' do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }
    context 'authenticated' do
      it 'will success if admin' do
        sign_in(admin)
        get(:show, params: { id: admin.id })
        expect(response).to render_template(:show)
        expect(response).to have_http_status('200')
      end
    end
  end
end
