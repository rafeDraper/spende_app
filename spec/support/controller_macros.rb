module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = create(:user, :admin)
      sign_in(admin)
    end
  end

  def login_editor
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:editor]
      editor = create(:user, :editor)
      sign_in(editor)
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:user)
      sign_in(user)
    end
  end
end
