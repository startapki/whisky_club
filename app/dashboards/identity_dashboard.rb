require 'administrate/base_dashboard'

class IdentityDashboard < Administrate::BaseDashboard
  def display_resource(item)
    item.name
  end
end
