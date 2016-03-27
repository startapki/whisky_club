class ApplicationController < ActionController::Base
  include Mengpaneel::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mixpanel

  private

  def setup_mixpanel
    return unless user_signed_in?

    mengpaneel.setup do
      mixpanel.identify(current_user.id)

      mixpanel.people.set(current_user_for_mixpanel)
    end
  end

  def current_user_for_mixpanel
    first_name, last_name = current_user.name.split(' ', 2)
    {
      'ID'              => current_user.id,
      '$email'          => current_user.email,
      '$first_name'     => first_name,
      '$last_name'      => last_name,
      '$created'        => current_user.created_at,
      '$last_login'     => current_user.current_sign_in_at
    }
  end
end
