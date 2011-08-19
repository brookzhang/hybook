class UsersController < ApplicationController
  before_filter :authenticate , :except => [:show , :new ,:create]
  before_filter :admin_user , :only=>:destroy
  before_filter :unlogged_in_user , :only=>[:new,:create]
  
  
  def index
    @title = "All users"
    @users = User.paginate(:page=>params[:page])
  end
  
  def new
    @user=User.new
    @title="Sign up"
    @action_title = "Sign up"
  end

  def show
    @user=User.find(params[:id])
    @title = "Bookroom"
    #@microposts =  @user.microposts.paginate(:page=>params[:page])
    #@microposts = @user.microposts ? @user.microposts.paginate(:page=>params[:page]) : @user.microposts
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to hybook!"
      redirect_to root_path
    else
      flash[:error] = "saved failed."
      @title = "Sign up"
      render 'new'
    end
  end
  
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page=> params[:page])
    render 'show_follow'
  end
  
  
  private #######################################################
  
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def unlogged_in_user
    flash[:error] = signed_in? ? "You have signed up." : nil
    redirect_to(root_path) unless !signed_in?
  end
end
