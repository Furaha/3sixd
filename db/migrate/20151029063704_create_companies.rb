class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :sub_description
      t.string :about
      t.string :location
      t.string :facebook
      t.string :google_plus
      t.string :twitter
      t.string :linkedin
      t.string :dribble

      t.timestamps null: false
    end
  end
end
