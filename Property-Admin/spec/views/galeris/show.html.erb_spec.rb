require 'rails_helper'

RSpec.describe "galeris/show", type: :view do
  include Rails.application.routes.url_helpers

  before(:each) do
    @galeri_post= assign(:galeri, FactoryBot.create(:galeri))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Regexp.escape(@galeri_post[:title])}/)
    expect(rendered).to match(/#{Regexp.escape(@galeri_post[:content])}/)
  end

  it "renders the post image" do
    render
    assert_select "img[src=?]", rails_blob_path(@galeri_post.image, only_path: true), count: 1
  end
end
