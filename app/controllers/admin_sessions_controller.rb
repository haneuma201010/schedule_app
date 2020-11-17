class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase) #AdminUserからemailのみで検索
    if admin_user && admin_user.authenticate(params[:session][:password]) #admin_userがnilでないかつパスワードが一致した場合
      admin_log_in admin_user #log_in(admin_user)と同じ、6行目のadmin_user
      # params[:session][:remember_me] == '1' ? remember(admin_user) : forget(admin_user)
      # remember admin_user
      redirect_to admin_user #これはどういうパス？rails tutorial 7.4.1参照
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end


  def destroy
    admin_log_out
    redirect_to root_url # root_pathにリダイレクトする
  end
end
