class Pin < ApplicationRecord
	has_one_attached :image
	has_many_attached :pictures
	has_rich_text :body

	validates :title, :body, :image, presence: true
    validates :body, length: {maximum: 200}
end