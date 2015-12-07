class AddDefaultFieldToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :default, :boolean
  end
end
