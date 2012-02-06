class Author::BaseController < ApplicationController
  include SessionsHelper
  layout 'author'

  before_filter :require_login

  protected

  def require_login
    return redirect_to("/signin") unless signed_in?
  end
end
