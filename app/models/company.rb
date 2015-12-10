class Company < ActiveRecord::Base
  mount_uploader :logo,        ImageUploader
  mount_uploader :intro_image, IntroImageUploader
  
  validates :name,        presence: true
  validates :title,       presence: true
  validates :description, presence: true
  validates :about,       presence: true
  validates :address1,    presence: true
  validates :city,        presence: true
  validates :state,       presence: true
  validates :zip,         presence: true, length: { is: 5 }
  validates :state,       presence: true, length: { is: 2 }, format: { with: /\A[A-Z]+\z/,
    message: "only allows 2 capital letters" }
  has_many  :users
end
