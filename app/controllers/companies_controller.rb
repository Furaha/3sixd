class CompaniesController < ApplicationController
  def new
  	@company = Company.new
  end

  def edit
    @company =  Company.find(params[:id])
  end

  def update
  	@company =  Company.find(params[:id])
  	respond_to do |format|
  	  if @company.update(company_params)
  	    flash[:success] = "Successfully updated the view contents for company: #{@company.name}!"
  	    format.html { redirect_to root_path }
  	  else
  	    flash[:danger] = "Sorry, unable to update the view contents for the company: #{@company.name}"
  	    format.html { render action: edit }
  	  end
  	end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :sub_description, :about, :address, :facebook, 
    	:google_plus, :twitter, :linkedin, :dribble)
  end
end