require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :id_com => 1,
      :product => "MyString",
      :describe => "MyString",
      :id_type => 1,
      :price => "",
      :inventory => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_id_com", :name => "product[id_com]"
      assert_select "input#product_product", :name => "product[product]"
      assert_select "input#product_describe", :name => "product[describe]"
      assert_select "input#product_id_type", :name => "product[id_type]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_inventory", :name => "product[inventory]"
    end
  end
end
