require 'rails_helper'

RSpec.describe "item_orders/index", type: :view do
  before(:each) do
    assign(:item_orders, [
      ItemOrder.create!(),
      ItemOrder.create!()
    ])
  end

  it "renders a list of item_orders" do
    render
  end
end
