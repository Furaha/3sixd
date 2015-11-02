class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        flash[:success] = "Successfully added a new company: #{@company.name}"
        format.html { redirect_to companies_path }
      else
        flash[:danger] = "Sorry, unable to add a new company"
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @company =  Company.find(params[:id])
  end

  def update
    @company =  Company.find(params[:id])
    respond_to do |format| 
      if @company.update(company_params)
        flash[:success] = "Successfully updated the view contents for company: #{@company.name}"
  	    format.html { redirect_to companies_path }
      else
        flash[:danger] = "Sorry, unable to update the view contents for the company: #{@company.name}"
        format.html { render action: 'edit' }
      end
    end
  end

  def index
    @companies = Company.all
  end

  def destroy
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.destroy
        flash[:success] = "Successfully deleted a company: #{@company.name}"
        format.html { redirect_to companies_path }
      else
        flash[:danger] = "Sorry, unable to delete the company"
        format.html { redirect_to companies_path }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :sub_description, :about, :address, :facebook, 
    	:google_plus, :twitter, :linkedin, :dribble)
  end
end