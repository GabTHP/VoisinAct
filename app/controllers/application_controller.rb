class ApplicationController < ActionController::Base

layout :set_layout

def set_layout
    if current_user
      'profil'
    else
      'application'
    end
 end
 protect_from_forgery with: :null_session

 # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
 

end


