class LeasesController < ApplicationController

  def create
    lease = Lease.create(lease_params)
    render json: lease
  end

  def destroy
    lease = find_lease
    lease.destroy
  end

  private

  def lease_params
    params.permit(:apartment_id, :tenant_id, :rent)
  end

  def find_lease
    Lease.find(params[:id])
  end

end
