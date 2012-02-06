class User::UsersController < User::BaseController
  def index
    @user=User.find(current_user)
    @author = @user.author ? "Yes":"No"
  end

  def show
  end

  def edit
    @user=User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attribute(:name,params[:user][:name])
      flash[:success] = "Profile updated."
      redirect_to "/user/users"
    else
      render :edit
    end
  end
end
