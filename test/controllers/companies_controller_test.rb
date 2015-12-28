require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  def setup
    sign_in users(:Furaha)
    @company = companies(:Furaha)
  end

  def logo
    @file ||= File.open(File.expand_path( '../../file/3sixd.png', __FILE__))
  end

  def intro_image
    @file ||= File.open(File.expand_path( '../../file/intro_image.png', __FILE__))
  end

  def css
    @file ||= File.open(File.expand_path( '../../file/customtheme.css', __FILE__))
  end

  def uploaded_logo(klass, attribute, logo, content_type = 'image/png')
    filename = File.basename(logo.path)
    klass_label = klass.to_s.underscore
   
    ActionDispatch::Http::UploadedFile.new(
      tempfile: logo,
      filename: filename,
      head: %Q{Content-Disposition: form-data; name="#{klass_label}[#{attribute}]"; filename="#{filename}"},
      content_type: content_type
    )
  end

  def logo_uploading
    company = Company.last
    assert_equal(File.basename(logo.path), company.logo_identifier)
  end

  def uploaded_intro_image(klass, attribute, intro_image, content_type = 'image/png')
    filename = File.basename(intro_image.path)
    klass_label = klass.to_s.underscore
   
    ActionDispatch::Http::UploadedFile.new(
      tempfile: intro_image,
      filename: filename,
      head: %Q{Content-Disposition: form-data; name="#{klass_label}[#{attribute}]"; filename="#{filename}"},
      content_type: content_type
    )
  end

  def intro_image_uploading
    company = Company.last
    assert_equal(File.basename(intro_image.path), company.intro_image_identifier)
  end

  def uploaded_css(klass, attribute, css, content_type = 'text/css')
    filename = File.basename(css.path)
    klass_label = klass.to_s.underscore
   
    ActionDispatch::Http::UploadedFile.new(
      tempfile: css,
      filename: filename,
      head: %Q{Content-Disposition: form-data; name="#{klass_label}[#{attribute}]"; filename="#{filename}"},
      content_type: content_type
    )
  end

  def css_uploading
    company = Company.last
    assert_equal(File.basename(css.path), company.css_identifier)
  end

  def company_name_after_logo_uploaded
    name = '3sixD'
    company = Company.last
    assert_equal name, company.name
  end

  def valid_company_params 
    { name: "3sixd", title: '3sixd Consulting', description: 'Upload Cvs - Get hired', 
      about: '3sixD posts jobs for the positions which they are currently hiring for and 
      you can apply to the ones that interest you', address1: '701 Craighead St', address2: 'Suite 107',
      city: 'Nashville', state_id: 1, zip: '37207', logo: "3six.png", css: "customtheme.css", 
      footer_about: 'Furaha makes softwares for your needs' }
  end

  test "is valid with valid company params" do
    company = Company.new valid_company_params
    assert company.valid?, "Can't create with valid params: #{company.errors.messages}"
  end

  test "is invalid without company name" do
    # Delete name before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :name
    assert company.errors[:name], "Missing error when without company name"
  end

  test "is invalid without company about" do
    # Delete about before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :about
    assert company.errors[:about], "Missing error when without company about"
  end

  test "is invalid without company footer about" do
    # Delete footer about before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :footer_about
    assert company.errors[:footer_about], "Missing error when without footer about"
  end

  test "is invalid without company address" do
    # Delete address before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :address1
    assert company.errors[:address1], "Missing error when without company address"
  end

  test "is invalid without company title" do
    # Delete title before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :title
    assert company.errors[:title], "Missing error when without company title"
  end

  test "is invalid without specifying a city where company is located" do
    # Delete city before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :city
    assert company.errors[:city], "Missing error when without city for the company"
  end

  test "is invalid without specifying a state where company is located" do
    # Delete city before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :state_id
    assert company.errors[:state_id], "Missing error when without state for the company"
  end

  test "is invalid without specifying a zip code for the company's address" do
    # Delete city before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :zip
    assert company.errors[:zip], "Missing error when without zip code for the company's address"
  end

  test "is invalid without company description" do
    # Delete description before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :description
    assert company.errors[:description], "Missing error when without company description"
  end

  test "should get add new company page" do
    get :new
    assert_response 302
  end

  test "should get edit existing company page" do
    get :edit, id: @company.id
    assert_response 302
  end

  test "should get all companies view page" do
    get :index
    assert_response 302
  end

  test "should have the default company when accesing the companies page" do
    get :index
    default_company = Company.find_by(default: true)
    assert_not_nil default_company
  end

  test "should have default company's title when accessing the companies page" do
    get :index
    default_company = Company.find_by(default: true)
    assert_equal default_company.title, '3sixD Consulting'
  end

  test "should have default company's address when accessing the companies page" do
    get :index
    default_company = Company.find_by(default: true)
    assert_equal default_company.address1, '700 Craighead St'
  end

  test "should have default company's city of where the company is located" do
    get :index
    default_company = Company.find_by(default: true)
    assert_equal default_company.city, 'Nashville'
  end

  test "should have default company's state of where the company is located" do
    get :index
    default_company = Company.find_by(default: true)
    assert_equal default_company.state.code, 'TN'
  end

  test "should have default company's address zip code of where the company is located" do
    get :index
    default_company = Company.find_by(default: true)
    assert_equal default_company.zip, '37204'
  end
end