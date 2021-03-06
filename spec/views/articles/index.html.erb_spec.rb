require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :location => "Location",
        :excerpt => "Excerpt"
      ),
      stub_model(Article,
        :title => "Title",
        :location => "Location",
        :excerpt => "Excerpt"
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Excerpt".to_s, :count => 2
  end
end
