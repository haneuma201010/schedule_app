module AdminSessionsHelper
  
  def log_in(admin_user) #なんかしらのデータを受け取る(この場合はadmin_user)  #admin_log_inのほうがいい？？使える？
    session[:admin_user_id] = admin_user.id #[:admin_user_id]っていう名前をつけた
    #session変数
  end
  
    # ユーザーのセッションを永続的にする
  def remember(admin_user)
    admin_user.remember
    cookies.permanent.signed[:admin_user_id] = admin_user.id
    cookies.permanent[:remember_token] = admin_user.remember_token
  end
  
  # 記憶トークンcookieに対応するユーザーを返す
  def current_admin_user
    if (admin_user_id = session[:admin_user_id])
      @current_admin_user ||= AdminUser.find_by(id: admin_user_id)
    elsif (admin_user_id = cookies.signed[:admin_user_id])
      admin_user = AdminUser.find_by(id: admin_user_id)
      if admin_user && admin_user.authenticated?(cookies[:remember_token])
        log_in admin_user
        @current_admin_user = admin_user
      end
    end
  end
  
  # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_admin_user?(admin_user)
    admin_user && admin_user == current_admin_user
  end

    # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_admin_user.nil?
  end
  # 永続的セッションを破棄する
  def forget(admin_user)
    admin_user.forget
    cookies.delete(:admin_user_id)
    cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def log_out
    forget(current_admin_user)
    session.delete(:admin_user_id)
    @current_admin_user = nil
  end

end
