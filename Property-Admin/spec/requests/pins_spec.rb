require 'rails_helper'


RSpec.describe "/pins", type: :request do
  include Rails.application.routes.url_helpers

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:account)
      Pin.create! valid_attributes
      get pins_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pin = Pin.create! valid_attributes
      get pin_url(pin)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:account)
      get "/galeris/new"
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      pin = Pin.create! valid_attributes
      get edit_pin_url(pin)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pin" do
        expect {
          post pins_url, params: { pin: valid_attributes }
        }.to change(Pin, :count).by(1)
      end

      it "redirects to the created pin" do
        post pins_url, params: { pin: valid_attributes }
        expect(response).to redirect_to(pin_url(Pin.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pin" do
        expect {
          post pins_url, params: { pin: invalid_attributes }
        }.to change(Pin, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post pins_url, params: { pin: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pin" do
        pin = Pin.create! valid_attributes
        patch pin_url(pin), params: { pin: new_attributes }
        pin.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the pin" do
        pin = Pin.create! valid_attributes
        patch pin_url(pin), params: { pin: new_attributes }
        pin.reload
        expect(response).to redirect_to(pin_url(pin))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        pin = Pin.create! valid_attributes
        patch pin_url(pin), params: { pin: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pin" do
      pin = Pin.create! valid_attributes
      expect {
        delete pin_url(pin)
      }.to change(Pin, :count).by(-1)
    end

    it "redirects to the pins list" do
      pin = Pin.create! valid_attributes
      delete pin_url(pin)
      expect(response).to redirect_to(pins_url)
    end
  end
end
