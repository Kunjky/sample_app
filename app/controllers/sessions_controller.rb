class SessionsController < ApplicationController
  before_action :fetch_user, only: :create

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      check = params[:session][:remember_me] == Settings.remember_checked
      check ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = t("flash.login_fail")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def fetch_user
    @user = User.find_by email: params[:session][:email].downcase
  end
end
