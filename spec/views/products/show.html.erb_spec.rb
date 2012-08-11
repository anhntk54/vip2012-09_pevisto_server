require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :id_com => 1,
      :product => "Product",
      :describe => "Describe",
      :id_type => 2,
      :price => "",
      :inventory => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Product/)
    rendered.should match(/Describe/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(/3/)
  end
end
