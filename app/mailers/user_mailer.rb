class UserMailer < ApplicationMailer
  default from: 'voisinact@hotmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://voisinact.herokuapp.com/' 
    mail(to: @user.email, subject: 'VOISINACT - Bienvenue chez nous !') 
  end

  def new_participant_email(attendance)
    @architect = attendance.involved_project.architect
    @participant = attendance.participant
    @project = attendance.involved_project
    mail(to: @architect.email, subject: 'VOISINACT - Nouveau participant !')
  end

  def new_project_involvement_email(attendance)
    @participant = attendance.participant
    @architect = attendance.participant
    @project = attendance.involved_project
    mail(to: @participant.email, subject: 'VOISINACT - Nouveau projet rejoint !')
  end

  def new_project_email(project)
    @architect = project.architect
    @project = project
    @url = 'https://voisinact.herokuapp.com/'
    mail(to: @architect.email, subject: 'VOISINACT - Nouveau projet créé !')
  end

  def user_modifications_email(user)
    @user = user
    @url = 'https://voisinact.herokuapp.com/'
    mail(to: @user.email, subject: 'VOISINACT - Modifications de vos paramètres utilisateur !')
  end

end
