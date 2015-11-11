require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  def setup
    @company = companies(:Furaha)
  end

  def file
    @file ||= File.open(File.expand_path( '../../file/3sixd.png', __FILE__))
  end

  def uploaded_file_object(klass, attribute, file, content_type = 'image/png')
    filename = File.basename(file.path)
    klass_label = klass.to_s.underscore
   
    ActionDispatch::Http::UploadedFile.new(
      tempfile: file,
      filename: filename,
      head: %Q{Content-Disposition: form-data; name="#{klass_label}[#{attribute}]"; filename="#{filename}"},
      content_type: content_type
    )
  end

  def test_logo_uploading
    company = Company.last
    assert_equal(File.basename(file.path), company.logo_identifier)
  end

  def company_name_after_logo_uploaded
    name = '3sixD'
    company = Company.last
    assert_equal name, company.name
  end

  test "should get add new company page" do
    get :new
    assert_response :success
  end

  test "should get edit existing company page" do
    get :edit, id: @company.id
    assert_response :success
  end

  test "should get all companies view page" do
    get :index
    assert_response :success
  end
end
