class AdminUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = AdminUser.all
  end
  
  def show
    @user = AdminUser.find(params[:id])
  end
  def new
    @user = AdminUser.new
  end
  
  def create
    @user = AdminUser.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "管理者登録成功！！おめでとう！！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = AdminUser.find(params[:id])
  end
  
  def update
    @user = AdminUser.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "管理者情報更新完了"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:success] = "管理者削除しました"
    redirect_to root_path
  end

  
  private

    def user_params
      params.require(:admin_user).permit(:name, :email, :password, :password_confirmation) # user_paramsにはname,email,password以外は渡さない
    end
    
    def logged_in_user
      unless admin_logged_in? # loginしていないならloginさせる
        flash[:danger] = "ログインしてください"
        redirect_to admin_login_path
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = AdminUser.find(params[:id]) # @userに代入
      redirect_to(root_url) unless current_admin_user?(@user) #current_admin_userメソッドのはずがcurrent_admin_user?メソッドを呼び出している
    end
    

end
