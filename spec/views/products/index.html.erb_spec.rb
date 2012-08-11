require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :id_com => 1,
        :product => "Product",
        :describe => "Describe",
        :id_type => 2,
        :price => "",
        :inventory => 3
      ),
      stub_model(Product,
        :id_com => 1,
        :product => "Product",
        :describe => "Describe",
        :id_type => 2,
        :price => "",
        :inventory => 3
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "Describe".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
