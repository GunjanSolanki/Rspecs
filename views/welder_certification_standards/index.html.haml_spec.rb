require 'rails_helper'

RSpec.describe "welder_certification_standards/index", type: :view do
  before(:each) do
    assign(:welder_certification_standards, [
      WelderCertificationStandard.create!(
        :name => "Name",
        :form_type => "Form Type"
      ),
      WelderCertificationStandard.create!(
        :name => "Name",
        :form_type => "Form Type"
      )
    ])
  end

  it "renders a list of welder_certification_standards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Form Type".to_s, :count => 2
  end
end
