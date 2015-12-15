class CompaniesController < ApplicationController
  before_action :authenticate_user!
  
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
    @default_company =  Company.find_by(default: 'true')
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
    params.require(:company).permit(:name, :title, :description, :about, :address1, :address2, :city, 
      :state_id, :zip, :facebook, :google_plus, :twitter, :linkedin, :dribble, :logo, :logo_cache, 
      :intro_image, :intro_image_cache, :css, :css_cache)
  end
end