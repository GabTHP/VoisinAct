class LikeController < ApplicationController
  def show
  end

  def update
    JoinLikeProject.create(like_id: @like.id, 
                        project_id: Project.find(params[:id]).id, 
                        quantity: params[:quantity])

    respond_to do |format|
      format.js {}
      format.html { render 'new'}
    end
  end

  def destroy
    project = Project.find(params[:id])
    JoinLikeProject.find_by(like_id: @like.id, project_id: project.id).destroy
    respond_to do |format|
      format.js  
    end
  end

  def is_in_like?(id)
    self.join_like_projects.find_by(like_id: self.id, project_id: id)
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :id)
  end

end
