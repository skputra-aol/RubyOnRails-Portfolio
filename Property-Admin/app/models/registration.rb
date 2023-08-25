class Registration < ApplicationRecord
    belongs_to :property
    belongs_to :pin
    belongs_to :vendor
    validates :property_id, :vendor_id, :pin_id, :tag_no, presence: true
    validates :note, length: {maximum: 400}

    scope :is_available, -> { where(:available) }
    scope :no_available, -> { where(available: false) }
    scope :long_note_text, ->(length = 50) { where("LENGTH(note) > ?", length) }

    include OrderableByTimestamp

    enum genre: { company: 1, agent: 2, personal: 3, other: 4 }

    def self.ransackable_attributes(auth_object = nil)
        ["property_id", "vendor_id", "pin_id", "tag_no", "note", "available","phone"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

    self.per_page = 5

end
