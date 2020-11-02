class AdminSessionsController < ApplicationController
  def new
  end

  def create
    user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # エラーメッセージを作成する
      render 'new'
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
