class AddFooterAboutToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :footer_about, :string
  end
end
