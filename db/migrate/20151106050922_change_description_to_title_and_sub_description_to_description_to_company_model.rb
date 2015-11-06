class ChangeDescriptionToTitleAndSubDescriptionToDescriptionToCompanyModel < ActiveRecord::Migration
  def change
    remove_column :companies, :sub_description, :string
    add_column    :companies, :title,  :string
  end
end
