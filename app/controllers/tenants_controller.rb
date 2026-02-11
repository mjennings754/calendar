class TenantsController < ApplicationController
  before_action :set_tenant, only: %i[edit show update destroy]
  def index
  end

  def new
    @tenant = Tenant.new
  end

  def edit
  end

  def show
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.user = current_user
    if @tenant.save
      redirect_to @tenant
    else
      render :new
    end
  end

  def update
    if @tenant.update(tenant_params)
      redirect_to @tenant
    else
      render :edit
    end
  end

  def destroy
    @tenant.destroy!
  end

  private

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params.expect(tenant: [:name, :user_id])
  end
end
