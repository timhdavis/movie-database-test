class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_page_title

  private 
  
  def set_page_title
    @page = "home"
  end

end
