class RemoveLocationAndAddAddressToCompany < ActiveRecord::Migration
  def change
  	remove_column :companies, :location, :string
  	add_column    :companies, :address,  :string
  end
end
