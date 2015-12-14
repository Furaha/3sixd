class AddCssToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :css, :string
  end
end
