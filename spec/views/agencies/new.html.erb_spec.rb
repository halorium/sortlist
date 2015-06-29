require 'rails_helper'

RSpec.describe "agencies/new", type: :view do
  before(:each) do
    assign(:agency, Agency.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new agency form" do
    render

    assert_select "form[action=?][method=?]", agencies_path, "post" do

      assert_select "input#agency_name[name=?]", "agency[name]"

      assert_select "textarea#agency_description[name=?]", "agency[description]"
    end
  end
end
