class Author::UsersController < Author::BaseController
  def index
    @user=User.find(current_user)
  end

  def show
  end

  def edit
    @user=User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attribute(:author_name,params[:user][:author_name])
      flash[:success] = "Profile updated."
      redirect_to "/author/users"
    else
      render :edit
    end
  end
end
