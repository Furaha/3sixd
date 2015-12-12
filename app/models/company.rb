class Company < ActiveRecord::Base
  mount_uploader :logo,        ImageUploader
  mount_uploader :intro_image, IntroImageUploader
  
  validates :name,        presence: true
  validates :title,       presence: true
  validates :description, presence: true
  validates :about,       presence: true
  validates :address1,    presence: true
  validates :city,        presence: true
  validates :zip,         presence: true, length: { is: 5 }
  has_many   :users
  belongs_to :state
end
