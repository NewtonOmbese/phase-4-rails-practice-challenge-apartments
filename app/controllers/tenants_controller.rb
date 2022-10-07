class TenantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def index
    tenants = Tenant.all
    render json: tenants
  end

  def show
    tenant = find_tenant
    render json: tenant
  end

  def create
    tenant = Tenant.create(tenant_params)
    render json: tenant
  end

  def update
    tenant = find_tenant
    tenant.update(tenant_params)
    render json: tenant
  end

  def destroy
    tenant = find_tenant
    tenant.destroy
  end

  private

  def find_tenant
    Tenant.find(params[:id])
  end

  def tenant_params
    params.permit(:name, :age)
  end

  def render_not_found_response
    render json: { errors: 'tenant not found' }, status: :not_found
  end

  def render_invalid_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
