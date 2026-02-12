class SeatsController < ApplicationController

    def new
    end

    def create
        @tenant = Tenant.find(params[:tenant_id])
        @user = User.find_by(username: params[:username])

        if @user.nil?
            redirect_to @tenant, notice: "User not found"
        end

        if @tenant.users.exists?(@user.id)
            redirect_to @tenant, notice: "User already has a seat"
        end

        @tenant.seats.create!(user: @user)

        redirect_to @tenant, notice: "Seat added successfully"
    end
end
