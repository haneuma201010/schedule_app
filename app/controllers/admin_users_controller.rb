class AdminUsersController < ApplicationController
  def new
  end
  def show
    @user = AdminUser.find(params[:id])
  end
  def new
    @user = AdminUser.new
  end
  
  def create
    @user = AdminUser.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      log_in @user
      flash[:success] = "登録成功！！おめでとう！！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  private

    def user_params
      params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
