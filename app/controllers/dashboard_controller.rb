class DashboardController < ApplicationController
  def home
    @tenants = current_user.tenants + current_user.owned_tenants
  end
end
