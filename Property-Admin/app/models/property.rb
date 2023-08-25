class Property < ApplicationRecord
    #mount_uploader :photo, PhotoUploader
    has_many :registrations, dependent: :destroy
    belongs_to :account

    scope :latest, -> { order created_at: :desc }
end
                 