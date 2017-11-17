require 'rails_helper'

RSpec.describe "drinks/new", type: :view do
  before(:each) do
    assign(:drink, Drink.new())
  end

  it "renders new drink form" do
    render

    assert_select "form[action=?][method=?]", drinks_path, "post" do
    end
  end
end
