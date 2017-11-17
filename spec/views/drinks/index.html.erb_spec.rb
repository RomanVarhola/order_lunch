require 'rails_helper'

RSpec.describe "drinks/index", type: :view do
  before(:each) do
    assign(:drinks, [
      Drink.create!(),
      Drink.create!()
    ])
  end

  it "renders a list of drinks" do
    render
  end
end
