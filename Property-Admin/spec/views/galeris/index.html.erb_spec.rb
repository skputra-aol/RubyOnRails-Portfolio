require 'rails_helper'

RSpec.describe "galeris/index", type: :view do
  include Rails.application.routes.url_helpers
  before(:each) do
    @galeris_post = assign(:galeris, [
      FactoryBot.create(:galeri),
      FactoryBot.create(:galeri),
    ])
  end

  it "renders a list of galeris" do
    render
    cell_selector = 'tr>td' 
    ## contains the post title
    assert_select cell_selector, text: Regexp.new(@galeris_post[0].title.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@galeris_post[1].title.to_s), count: 1
    ## contains the post content
    assert_select cell_selector, text: Regexp.new(@galeris_post[0].content.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@galeris_post[1].content.to_s), count: 1

    ## test for the image
    assert_select "img[src=?]", rails_blob_path(@galeris_post[0].image, only_path: true), count: 1
    assert_select "img[src=?]", rails_blob_path(@galeris_post[1].image, only_path: true), count: 1

  end


end