require 'rails_helper'

RSpec.describe "vendors/index", type: :view do
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
  

  it "renders a list of vendors" do
    
    @q = Vendor.ransack(params[:q])
    @vendors = @q.result.page(params[:page])
    @posts=@vendors
    @registrations=@vendors
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'tr>th' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Person".to_s), count: 1
  end


end
