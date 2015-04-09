class UsersController < ApplicationController
  def index
    @user_name=User.find(1)
    @user_profile=Profile.find_by_user_id(@user_name.id)
    @imagefile=Image.first
  end

 def new
    @new_user=User.new

 end

  def create
    @new_user=User.create(new_user)

    if @new_user.save
      redirect_to users_path
    end
  end

  def edit
      @edit_profile=Profile.find(:user_id => params[:id])

    respond_to do |format|
      format.js{}
    end
  end

  def update
    logger.debug(params)
     #@edit_profile=Profile.find(:user_id=>params[:id])
     @profile_image=Image.new
     @profile_image.update_attributes(:avatar=>params[:avatar],:user_id=>params[:id])
      @edit_profile.update_attributes(update_profile)



      redirect_to users_path
  end

  def update_profile
    params.require(:profile).permit(:user_id,:about,:name,:age,:avatar)
  end

  def update_image
    params.require(:image).permit(:avatar,:user_id)
  end

  def new_user
    params.require(:user).permit(:name,:email,:user_name,:password)
  end
end
