class AttendancesController < ApplicationController
  
  def create
    @attendance = Attendance.new(involved_project_id: params[:project_id], participant: current_user)
    puts "$"*60
    puts params
    puts "$"*60
    if @attendance.save
      render project_path(params[:project_id])
    else
      render project_path(params[:project_id])
    end
  end

  def destroy
    
  end

end
