class Registration < ApplicationRecord
    validates :property_id, :vendor_id, :pin_id, :tag_no, presence: true
    validates :note, length: {maximum: 400}

end
