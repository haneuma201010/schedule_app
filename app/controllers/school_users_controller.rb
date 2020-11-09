class SchoolUsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = SchoolUser.all
  end
  
  def show
    @user = SchoolUser.find(params[:id])
  end
  def new
    @user = SchoolUser.new
  end
  
  def create
    @user = SchoolUser.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "教室アカウント登録成功！！おめでとう！！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = SchoolUser.find(params[:id])
  end
  
  def update
    @user = SchoolUser.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "教室情報更新完了"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    SchoolUser.find(params[:id]).destroy
    flash[:success] = "教室を削除しました"
    redirect_to root_path
  end

  
  private

    def user_params
      params.require(:school_user).permit(:name, :email, :password, :password_confirmation)
    end
    

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to school_login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = SchoolUser.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    

end
