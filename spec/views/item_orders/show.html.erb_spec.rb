require 'rails_helper'

RSpec.describe "item_orders/show", type: :view do
  before(:each) do
    @item_order = assign(:item_order, ItemOrder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
