require 'rails_helper'

RSpec.describe "galeris/edit", type: :view do
    let(:galeri) {
      FactoryBot.create(:galeri)
    }

  before(:each) do
    assign(:galeri, galeri)
  end

  it "renders the edit galeri form" do
    render

    assert_select "form[action=?][method=?]", galeri_path(galeri), "post" do

      assert_select "input[name=?]", "galeri[title]"

      assert_select "textarea[name=?]", "galeri[content]"

      assert_select "input[name=?]", "galeri[image]"
    end
  end
end