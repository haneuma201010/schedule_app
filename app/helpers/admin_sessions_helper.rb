module AdminSessionsHelper
  
  def admin_log_in(admin_user) # なんかしらのデータを受け取る(この場合はadmin_user)
    session[:admin_user_id] = admin_user.id # [:admin_user_id]っていう名前をつけた
    # ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成される。プラウザを閉じた瞬間に有効期限が終了する
    # session変数
  end
  
  # # ユーザーのセッションを永続的にする
  # def remember(admin_user)
  #   admin_user.remember
  #   cookies.permanent.signed[:admin_user_id] = admin_user.id
  #   cookies.permanent[:remember_token] = admin_user.remember_token
  # end
  
  
  # 現在ログインしているユーザーを返す（いる場合）
  def current_admin_user
    if session[:admin_user_id]
      @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])# @current_admin_user = @current_admin_user || AdminUser.find_by(id: admin_user_id)
                                                                                        # @current_admin_userに値がなにもないときのみAdminUserに問い合わせる
    end
  end
  # def current_admin_user
  #   if (admin_user_id = session[:admin_user_id]) 
  #     @current_admin_user ||= AdminUser.find_by(id: admin_user_id) # @current_admin_user = @current_admin_user || AdminUser.find_by(id: admin_user_id)
  #                                                                                       # @current_admin_userに値がなにもないときのみAdminUserに問い合わせる
  #   elsif (admin_user_id = cookies.signed[:admin_user_id])
  #     admin_user = AdminUser.find_by(id: admin_user_id)
  #     if admin_user && admin_user.authenticated?(cookies[:remember_token])
  #       admin_log_in admin_user
  #       @current_admin_user = admin_user
  #     end
  #   end
  # end
  
  # # 渡されたユーザーがカレントユーザーであればtrueを返す
  # def current_admin_user?(admin_user)
  #   admin_user && admin_user == current_admin_user
  # end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def admin_logged_in?
    !current_admin_user.nil?
    # current_admin_userがnilでないかの !。current_admin_user?でもいいような
  end
  # # 永続的セッションを破棄する
  # def forget(admin_user)
  #   admin_user.forget
  #   cookies.delete(:admin_user_id)
  #   cookies.delete(:remember_token)
  # end

  # 現在のユーザーをログアウトする
  def admin_log_out
    # forget(current_admin_user)
    session.delete(:admin_user_id) # 現在のユーザーをnilにする
    @current_admin_user = nil
  end

end
