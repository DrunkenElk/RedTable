class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :check_password, :only => [:update]

  def index
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    respond_with(@user)
  end

  def edit
    respond_with(@user)
  end

  def create
    @user.save
    respond_with(@user)
  end

  def update
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

private

  def check_password
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
  end

end
