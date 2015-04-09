class ProfilesController < ApplicationController

  def new
    p params
    @new_profile=Profile.new
  end

  def create
    @new_profile=Profile.create(create_profile)
    @new_profile.save
    redirect_to 'users/index/'
  end

  def update
    @edit_profile=Profile.find(params[:id])
    @edit_profile.update_attributes(create_profile)
  end

  def create_profile
    params.require(:profile).permit(:user_id,:about,:name,:age)
  end
end
