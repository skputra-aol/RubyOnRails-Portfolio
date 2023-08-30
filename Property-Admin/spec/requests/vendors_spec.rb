require 'rails_helper'

RSpec.describe "/vendors", type: :request do
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
      Vendor.create! valid_attributes
      get vendors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      vendor = Vendor.create! valid_attributes
      get vendor_url(vendor)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:account)
      get new_vendor_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      vendor = Vendor.create! valid_attributes
      get edit_vendor_url(vendor)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vendor" do
        expect {
          post vendors_url, params: { vendor: valid_attributes }
        }.to change(Vendor, :count).by(1)
      end

      it "redirects to the created vendor" do
        post vendors_url, params: { vendor: valid_attributes }
        expect(response).to redirect_to(vendor_url(Vendor.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vendor" do
        expect {
          post vendors_url, params: { vendor: invalid_attributes }
        }.to change(Vendor, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post vendors_url, params: { vendor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested vendor" do
        vendor = Vendor.create! valid_attributes
        patch vendor_url(vendor), params: { vendor: new_attributes }
        vendor.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the vendor" do
        vendor = Vendor.create! valid_attributes
        patch vendor_url(vendor), params: { vendor: new_attributes }
        vendor.reload
        expect(response).to redirect_to(vendor_url(vendor))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        vendor = Vendor.create! valid_attributes
        patch vendor_url(vendor), params: { vendor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested vendor" do
      vendor = Vendor.create! valid_attributes
      expect {
        delete vendor_url(vendor)
      }.to change(Vendor, :count).by(-1)
    end

    it "redirects to the vendors list" do
      vendor = Vendor.create! valid_attributes
      delete vendor_url(vendor)
      expect(response).to redirect_to(vendors_url)
    end
  end
end
