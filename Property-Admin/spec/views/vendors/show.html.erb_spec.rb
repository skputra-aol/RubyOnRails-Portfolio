require 'rails_helper'

RSpec.describe "vendors/show", type: :view do
  before(:each) do
    assign(:vendor, Vendor.create!(
      name: "Name",
      address: "Address",
      phone: "12345678",
      person: "Person",
      refno: "11111",
      category: "company"
    ))
  end

  it "renders attributes in <td>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Person/)
  end
end
