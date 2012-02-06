class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
end
