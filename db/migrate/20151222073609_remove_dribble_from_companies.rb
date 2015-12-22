class RemoveDribbleFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :dribble, :string
  end
end
