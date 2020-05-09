require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'Static Pages routes working' do
    context 'geting static pages' do
      it 'render the home page' do
        get :help
      end

      it 'render the help page' do
        get :help
      end

      it 'render the contact page' do
        get :contact
      end

    end
  end
end
