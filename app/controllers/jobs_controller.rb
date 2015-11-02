class JobsController < ApplicationController
  def index
    # The line below to load a company is not supposed to be like that, so later when we have 
    # the User model setup and once associted with Company then the line will change to 
    # @company = @current_user.company
    @company = Company.first
  end
end
