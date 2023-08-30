class Property < ApplicationRecord
    #mount_uploader :photo, PhotoUploader
    has_many :registrations, dependent: :destroy
    belongs_to :account

    validates :name, :price, :rooms, :bathrooms, presence: true

    scope :latest, -> { order created_at: :desc }

end
                 