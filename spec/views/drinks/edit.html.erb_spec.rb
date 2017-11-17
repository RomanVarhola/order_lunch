require 'rails_helper'

RSpec.describe "drinks/edit", type: :view do
  before(:each) do
    @drink = assign(:drink, Drink.create!())
  end

  it "renders the edit drink form" do
    render

    assert_select "form[action=?][method=?]", drink_path(@drink), "post" do
    end
  end
end
