class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password]) #admin_userがnilでないかつパスワードが一致した場合
      log_in admin_user #log_in(admin_user)と同じ、6行目のadmin_user
      params[:session][:remember_me] == '1' ? remember(admin_user) : forget(admin_user)
      remember admin_user
      redirect_to admin_user #これはどういうパス？
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
