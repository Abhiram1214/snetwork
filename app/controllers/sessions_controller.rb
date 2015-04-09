class SessionsController < ApplicationController
  def new
  end

  def create
    p params
    user=User.authenticate(params[:email],params[:password])
    if user
      p "working"
      session[:user_id]=user.id
       redirect_to users_path, notice: 'Logged In'

    else
      p "Abhiram"
      flash.now.alert="authentication failed"
    end
  end


  def destroy
    reset_session
    redirect_to 'log_in'
  end

end
