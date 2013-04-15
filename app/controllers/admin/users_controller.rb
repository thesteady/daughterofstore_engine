class Admin::UsersController < ApplicationController
  before_filter :require_admin

  def new
    fail
    @store = current_store
    @user = User.new
  end

  def create
    email = params[:user][:email]
    @user = User.find_by_email(email)
    @store = current_store

    if @user
      ur = UserRole.create(store_id: @store.id, user_id: @user.id)
      ur.role = "store_admin"
      ur.save
      Mailer.store_admin_welcome_email(@user, @store).deliver
      redirect_to store_admin_path(@store), notice: "Admin added!"
    else
      Mailer.sign_up_as_admin(email, @store).deliver
      redirect_to store_admin_path(@store), notice: "This person is not currently registered with Pink SoSE.  A welcome email has been sent on your behalf."
    end
  end

  def destroy
    @store = current_store
    @user = User.find(params[:id])

    ur = UserRole.find_by_user_id_and_store_id(@user, @store)
    ur.destroy
    Mailer.remove_admin_from_store(@user, @store).deliver
    redirect_to store_admin_path(@store), notice: "Admin privileges for #{@user} have been removed."
  end
end
