class Pin < ApplicationRecord
	has_one_attached :image
	has_many_attached :pictures
	has_rich_text :body

	has_many :registrations, dependent: :destroy

	include OrderableByTimestamp

    scope :long_body_text, ->(length = 50) { where("LENGTH(body) > ?", length) }

	validates :title, :body, presence: true
    validates :body, length: {maximum: 200}
end