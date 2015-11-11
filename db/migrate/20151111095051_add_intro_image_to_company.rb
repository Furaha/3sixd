class AddIntroImageToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :intro_image, :string
  end
end
