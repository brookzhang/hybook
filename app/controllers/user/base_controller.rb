class User::BaseController < ApplicationController
  include SessionsHelper
  layout 'user'

  before_filter :require_login

  protected

  def require_login
    return redirect_to("/signin") unless signed_in?
  end
end
