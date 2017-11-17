require 'rails_helper'

RSpec.describe "item_orders/new", type: :view do
  before(:each) do
    assign(:item_order, ItemOrder.new())
  end

  it "renders new item_order form" do
    render

    assert_select "form[action=?][method=?]", item_orders_path, "post" do
    end
  end
end
