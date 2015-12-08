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

  def company_name_after_logo_uploaded
    name = '3sixD'
    company = Company.last
    assert_equal name, company.name
  end

  def valid_company_params 
    { name: "3sixd", title: '3sixd Consulting', description: 'Upload Cvs - Get hired', 
      about: '3sixD posts jobs for the positions which they are currently hiring for and 
      you can apply to the ones that interest you', address: '3000, Silcon Valley', logo: "3six.png" }
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

  test "is invalid without company address" do
    # Delete address before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :address
    assert company.errors[:address], "Missing error when without company address"
  end

  test "is invalid without company title" do
    # Delete title before assert company is called
    company = Company.new valid_company_params
    valid_company_params.delete :title
    assert company.errors[:title], "Missing error when without company title"
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
end
