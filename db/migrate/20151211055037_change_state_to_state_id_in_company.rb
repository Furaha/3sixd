class ChangeStateToStateIdInCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :state,     :string
    add_column    :companies, :state_id,  :integer
  end
end
