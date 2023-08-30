require 'rails_helper'

RSpec.describe "vendors/edit", type: :view do
  let(:vendor) {
    Vendor.create!(
      name: "MyString",
      address: "MyString",
      phone: "MyString",
      person: "MyString",
      refno: "11111",
      category: "company"
    )
  }

  before(:each) do
    assign(:vendor, vendor)
  end

  it "renders the edit vendor form" do
    render

    assert_select "form[action=?][method=?]", vendor_path(vendor), "post" do

      assert_select "input[name=?]", "vendor[name]"

      assert_select "input[name=?]", "vendor[address]"

      assert_select "input[name=?]", "vendor[phone]"

      assert_select "input[name=?]", "vendor[person]"
    end
  end
end
