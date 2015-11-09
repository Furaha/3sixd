class Company < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  
  validates :name,            presence: true
  validates :title,           presence: true
  validates :description,     presence: true
  validates :about,           presence: true
  validates :address,         presence: true
end
