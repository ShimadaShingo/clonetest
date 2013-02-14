class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_charset
 
  private
 
  def set_charset
    headers['Content-Type'] = 'text/html; charset=UTF-8'
  end

end
