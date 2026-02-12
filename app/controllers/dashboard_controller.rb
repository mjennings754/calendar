class DashboardController < ApplicationController
  def home
    @tenants = current_user.tenants
  end
end
