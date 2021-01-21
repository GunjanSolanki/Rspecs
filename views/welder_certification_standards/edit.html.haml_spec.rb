require 'rails_helper'

RSpec.describe "welder_certification_standards/edit", type: :view do
  before(:each) do
    @welder_certification_standard = assign(:welder_certification_standard, WelderCertificationStandard.create!(
      :name => "MyString",
      :form_type => "MyString"
    ))
  end

  it "renders the edit welder_certification_standard form" do
    render

    assert_select "form[action=?][method=?]", welder_certification_standard_path(@welder_certification_standard), "post" do

      assert_select "input[name=?]", "welder_certification_standard[name]"

      assert_select "input[name=?]", "welder_certification_standard[form_type]"
    end
  end
end
