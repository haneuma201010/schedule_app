class StudentUsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = StudentUser.all
  end
  
  def show
    @user = StudentUser.find(params[:id])
  end
  def new
    @user = StudentUser.new
  end
  
  def create
    @user = StudentUser.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "生徒アカウント登録成功！！おめでとう！！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = StudentUser.find(params[:id])
  end
  
  def update
    @user = StudentUser.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "生徒情報更新完了"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    StudentUser.find(params[:id]).destroy
    flash[:success] = "生徒情報を削除しました"
    redirect_to root_path
  end

  
  private

    def user_params
      params.require(:student_user).permit(:name, :email, :password, :password_confirmation)
    end
    

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to student_login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = StudentUser.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
