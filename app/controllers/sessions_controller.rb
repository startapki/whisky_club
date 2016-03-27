class SessionsController < Devise::SessionsController
  def create
    super do
      mixpanel.track('Sign In')
    end
  end

  def destroy
    super do
      mixpanel.track('Sign Out')
    end
  end
end
