class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:user_id])
		current_user.follow(user)
		redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
		current_user.unfollow(user)
		redirect_to request.referer
  end

  def following #follower一覧
    user = User.find(params[:user_id])
		@users = user.following
    # .following_userメソッド ：Userモデルで定義済
  end

  def followers #followed一覧
    user = User.find(params[:user_id])
		@users = user.followers
    # .follower_userメソッド ：Userモデルで定義済
  end

end
