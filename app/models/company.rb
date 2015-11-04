class Company < ActiveRecord::Base
  validates :name,            presence: true
  validates :description,     presence: true
  validates :sub_description, presence: true
  validates :about,           presence: true
  validates :address,         presence: true
end
