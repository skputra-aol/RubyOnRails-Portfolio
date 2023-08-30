require 'rails_helper'

RSpec.describe "galeris/new", type: :view do
  before(:each) do
    assign(:galeri, FactoryBot.build(:galeri))
  end

  it "renders new galeri form" do
    render

    assert_select "form[action=?][method=?]", galeris_path, "post" do

      assert_select "input[name=?]", "galeri[title]"

      assert_select "textarea[name=?]", "galeri[content]"

      ### check for file upload image
      assert_select "input[name=?]", "galeri[image]"
    end
  end
end