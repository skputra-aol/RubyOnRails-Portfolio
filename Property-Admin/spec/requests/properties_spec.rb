require 'rails_helper'

RSpec.describe "/properties", type: :request do
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
      Property.create! valid_attributes
      get properties_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      property = Property.create! valid_attributes
      get property_url(property)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:account)
      get new_property_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      property = Property.create! valid_attributes
      get edit_property_url(property)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Property" do
        expect {
          post properties_url, params: { property: valid_attributes }
        }.to change(Property, :count).by(1)
      end

      it "redirects to the created property" do
        post properties_url, params: { property: valid_attributes }
        expect(response).to redirect_to(property_url(Property.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Property" do
        expect {
          post properties_url, params: { property: invalid_attributes }
        }.to change(Property, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post properties_url, params: { property: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested property" do
        property = Property.create! valid_attributes
        patch property_url(property), params: { property: new_attributes }
        property.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the property" do
        property = Property.create! valid_attributes
        patch property_url(property), params: { property: new_attributes }
        property.reload
        expect(response).to redirect_to(property_url(property))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        property = Property.create! valid_attributes
        patch property_url(property), params: { property: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested property" do
      property = Property.create! valid_attributes
      expect {
        delete property_url(property)
      }.to change(Property, :count).by(-1)
    end

    it "redirects to the properties list" do
      property = Property.create! valid_attributes
      delete property_url(property)
      expect(response).to redirect_to(properties_url)
    end
  end
end
