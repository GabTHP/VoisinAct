class LikesController < ApplicationController
     before_action :authenticate_user!

  def show
    @like = Like.find_by(user: current_user)
    @like_projects = LikeProject.all.select {|like_project| like_project.like == @like}

  end

end
