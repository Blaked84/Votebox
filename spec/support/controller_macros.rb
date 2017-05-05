module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_user(custom_user = nil)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = custom_user || FactoryGirl.create(:user)
      sign_in user
    end
  end

end