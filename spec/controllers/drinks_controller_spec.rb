require 'rails_helper'

RSpec.describe DrinksController, type: :controller do
  let(:admin_user) { User.create!(email: 'admin@example.com', password: '12345678', first_name: 'Admin', last_name: 'Admin', role: 1) }

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in(admin_user)
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      drink = Drink.create!(title: 'Cofee', dtype: :hot_water, price: 2.5)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      drink = Drink.create!(title: 'Cofee', dtype: :hot_water, price: 2.5)
      get :show, params: {id: drink.to_param}
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
      drink = Drink.create!(title: 'Cofee', dtype: :hot_water, price: 2.5)
      get :edit, params: {id: drink.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Drink" do
        expect {
          post :create, params: {drink: { title: 'Cofee', dtype: :hot_water, price: 2.5 }}
        }.to change(Drink, :count).by(1)
      end

      it "redirects to the created drink" do
        post :create, params: {drink: { title: 'Cofee', dtype: :hot_water, price: 2.5 }}, session: valid_session
        expect(response).to redirect_to drinks_path
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested drink" do
        drink = Drink.create!(title: 'Cofee', dtype: 1, price: 2.5)
        put :update, params: {id: drink.to_param, drink: { price: 3.0 }}, session: valid_session
        drink.reload
        expect(drink.price).to eq 3.0
      end

      it "redirects to the drink" do
        drink = Drink.create!(title: 'Cofee', dtype: 1, price: 2.5)
        put :update, params: {id: drink.to_param, drink: { price: 3.0 }}, session: valid_session
        expect(response).to redirect_to drinks_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested drink" do
      drink = Drink.create!(title: 'Cofee', dtype: 1, price: 2.5)
      expect {
        delete :destroy, params: {id: drink.to_param}, session: valid_session
      }.to change(Drink, :count).by(-1)
    end

    it "redirects to the drinks list" do
      drink = Drink.create!(title: 'Cofee', dtype: 1, price: 2.5)
      delete :destroy, params: {id: drink.to_param}, session: valid_session
      expect(response).to redirect_to(drinks_url)
    end
  end

end
