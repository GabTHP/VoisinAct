class LikesController < ApplicationController

  def show
    @like = Like.find_by(id: current_user)
    @like_projects = [LikeProject.find_by(like_id: @like)]
  end




end
