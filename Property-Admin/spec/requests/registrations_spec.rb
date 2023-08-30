require 'rails_helper'

RSpec.describe "/registrations", type: :request do
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
      Registration.create! valid_attributes
      get registrations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      registration = Registration.create! valid_attributes
      get registration_url(registration)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:account)
      get new_registration_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      registration = Registration.create! valid_attributes
      get edit_registration_url(registration)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Registration" do
        expect {
          post registrations_url, params: { registration: valid_attributes }
        }.to change(Registration, :count).by(1)
      end

      it "redirects to the created registration" do
        post registrations_url, params: { registration: valid_attributes }
        expect(response).to redirect_to(registration_url(Registration.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Registration" do
        expect {
          post registrations_url, params: { registration: invalid_attributes }
        }.to change(Registration, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post registrations_url, params: { registration: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested registration" do
        registration = Registration.create! valid_attributes
        patch registration_url(registration), params: { registration: new_attributes }
        registration.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the registration" do
        registration = Registration.create! valid_attributes
        patch registration_url(registration), params: { registration: new_attributes }
        registration.reload
        expect(response).to redirect_to(registration_url(registration))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        registration = Registration.create! valid_attributes
        patch registration_url(registration), params: { registration: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested registration" do
      registration = Registration.create! valid_attributes
      expect {
        delete registration_url(registration)
      }.to change(Registration, :count).by(-1)
    end

    it "redirects to the registrations list" do
      registration = Registration.create! valid_attributes
      delete registration_url(registration)
      expect(response).to redirect_to(registrations_url)
    end
  end
end
