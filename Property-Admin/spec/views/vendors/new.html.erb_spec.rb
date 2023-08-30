require 'rails_helper'

RSpec.describe "vendors/new", type: :view do
  before(:each) do
    assign(:vendor, Vendor.new(
      name: "MyString",
      address: "MyString",
      phone: "MyString",
      person: "MyString",
      refno: "11111",
      category: "company"
    ))
  end

  it "renders new vendor form" do
    render

    assert_select "form[action=?][method=?]", vendors_path, "post" do

      assert_select "input[name=?]", "vendor[name]"

      assert_select "input[name=?]", "vendor[address]"

      assert_select "input[name=?]", "vendor[phone]"

      assert_select "input[name=?]", "vendor[person]"
    end
  end
end
