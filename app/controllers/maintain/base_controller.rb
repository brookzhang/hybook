class Maintain::BaseController < ApplicationController
  include SessionsHelper
  layout 'maintain'

  before_filter :require_login

  protected

  def require_login
    return redirect_to(maintain_session_path) unless signed_in?
  end

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
end
