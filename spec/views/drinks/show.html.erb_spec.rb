require 'rails_helper'

RSpec.describe "drinks/show", type: :view do
  before(:each) do
    @drink = assign(:drink, Drink.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
