class UsersController < ApplicationController
  before_action :authenticate_user!,  expect:[:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    binding.pry
    if @user != current_user
      redirect_to users_path,alert:"異なるメンバーのプロフィールは操作できません"
    end
  end
  
  def check
    @user = User.find(params[:id])
    #ユーザーの情報を見つける
  end
  

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user),notice:"更新完了"
    else
      render :edit
    end
  end
  
  def withdrawl
    @user = User.find(current_user.id)
    #現在ログインしているユーザーを@userに格納
    @user.update(is_active: "Invalid")
    #updateで登録情報をInvalidに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end
  

  private
  def user_params 
    params.require(:user).permit(:active, :username, :email, :profile, :profile_image)
  end
  

end
