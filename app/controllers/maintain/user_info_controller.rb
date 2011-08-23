class Maintain::UserInfoController < Maintain::BaseController
  def show
    @user=User.find(current_user)
    @author = @user.author ? "Yes":"No"
  end

  def edit
    @user=User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attribute(:name,params[:user][:name])
      flash[:success] = "Profile updated."
      redirect_to "/maintain/user_info"
    else
      render :edit
    end
  end

end
