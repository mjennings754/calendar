class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.email_verification(@user).deliver_later
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
  end

  def verify_email
    @user = User.find_by(verification_token: params[:token])
    if @user&.verify_email(params[:token])
      redirect_to users_path, notice: "Your email has been verified"
    else
      redirect_to users_path, notice: "Invalid token"
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(user: [:username, :email, :password, :password_confirmation])
  end
end
