class Maintain::AuthorInfoController < Maintain::BaseController
  def show
    @user=User.find(current_user)
    @author = @user.author ? "Yes":"No"
  end

  def edit
    @user=User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attribute(:author_name,params[:user][:author_name])
      flash[:success] = "Profile updated."
      redirect_to "/maintain/author_info"
    else
      render :edit
    end
  end

end
