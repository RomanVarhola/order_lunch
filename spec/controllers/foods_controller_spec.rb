require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:admin_user) { User.create!(email: 'admin@example.com', password: '12345678', first_name: 'Admin', last_name: 'Admin', role: 1) }

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in(admin_user)
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
      get :show, params: {id: food.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
      get :edit, params: {id: food.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Drink" do
        expect {
          post :create, params: {food: { title: 'Fried Potatoes', ftype: :hot_food, price: 2.0 }}
        }.to change(Food, :count).by(1)
      end

      it "redirects to the created drink" do
        post :create, params: {food: { title: 'Fried Potatoes', ftype: :hot_food, price: 2.0 }}, session: valid_session
        expect(response).to redirect_to foods_path
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested drink" do
        food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
        put :update, params: {id: food.to_param, food: { price: 3.0 }}, session: valid_session
        food.reload
        expect(food.price).to eq 3.0
      end

      it "redirects to the drink" do
        food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
        put :update, params: {id: food.to_param, food: { price: 3.0 }}, session: valid_session
        expect(response).to redirect_to foods_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested drink" do
      food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
      expect {
        delete :destroy, params: {id: food.to_param}, session: valid_session
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the drinks list" do
      food = Food.create!(title: 'Fried Potatoes', ftype: :hot_food, price: 2.0)
      delete :destroy, params: {id: food.to_param}, session: valid_session
      expect(response).to redirect_to(foods_url)
    end
  end

end
