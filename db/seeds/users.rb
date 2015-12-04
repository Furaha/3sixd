user = User.create!(
  :email => 'jim.heffner@3sixd.com', :password => 'admin123', :password_confirmation => 'admin123'
)
user.skip_confirmation!
user.save!