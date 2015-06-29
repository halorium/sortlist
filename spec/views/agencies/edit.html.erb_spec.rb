require 'rails_helper'

RSpec.describe "agencies/edit", type: :view do
  before(:each) do
    @agency = assign(:agency, Agency.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit agency form" do
    render

    assert_select "form[action=?][method=?]", agency_path(@agency), "post" do

      assert_select "input#agency_name[name=?]", "agency[name]"

      assert_select "textarea#agency_description[name=?]", "agency[description]"
    end
  end
end
