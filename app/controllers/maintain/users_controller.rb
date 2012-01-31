class Maintain::UsersController < Maintain::BaseController
  def index
    @users = User.order("id desc").all
  end
  
  def show
    @user=User.find(params[:id])
    @author = @user.author ? "Yes":"No"
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to(:action => 'show', :id => @user)
    else
      flash[:error] = "Profile updated failed."
      render 'edit'
    end
    
    
  end
  
  def new
    
  end
end
