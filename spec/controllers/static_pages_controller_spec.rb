RSpec.describe StaticPagesController, type: :controller do
  describe 'Static pages controller' do
    render_views
    context 'requests: ' do
      it 'render the home page' do
        get :home
        expect(response).to render_template('static_pages/home')
        expect(response.status).to eq(200)
      end

      it 'render the help page' do
        get :help
        expect(response).to render_template('static_pages/help')
        expect(response.status).to eq(200)
      end

      it 'render the contact page' do
        get :contact
        expect(response).to render_template('static_pages/contact')
        expect(response.status).to eq(200)
      end
    end
  end
end
