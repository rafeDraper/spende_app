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
    context 'authenticated' do
      it 'success if signed in' do
        sign_in(user)
        get(:show, params: { id: user.id })
        expect(response).to render_template(:show)
        expect(response).to have_http_status('200')
      end
    end
  end

  describe '#destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }

    context 'authenticated' do
      it 'success if signed in as admin' do
        sign_in(admin)
        delete(:destroy, params: { id: user })
        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to match(/Nutzer Gelöscht/)
      end
    end

    context 'authenticated not as admin' do
      it 'fail if signed in as user' do
        sign_in(user)
        delete(:destroy, params: { id: admin })
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Benutzer ist nicht Autorisiert/)
      end
    end
  end

  describe '#update' do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }

    context 'authenticated' do
      it 'success if signed in as admin' do
        sign_in(admin)
        user_params = FactoryBot.attributes_for(:user, role: 'editor')
        patch(:update, params: { id: user.id, user: user_params })
        expect(response).to redirect_to(users_path)
        expect(user.reload.role).to eq('editor')
        expect(flash[:notice]).to match(/Benutzer erfolgreich aktualisiert/)
      end
    end
    
  end
end
