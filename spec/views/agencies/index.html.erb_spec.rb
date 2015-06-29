require 'rails_helper'

RSpec.describe "agencies/index", type: :view do
  before(:each) do
    assign(:agencies, [
      Agency.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Agency.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of agencies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
