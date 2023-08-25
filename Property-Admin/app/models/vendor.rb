class Vendor < ApplicationRecord
    has_many :registrations, dependent: :destroy

    validates :refno, :name, :person, :category, presence: true
    validates :refno, uniqueness: 
      {message: 'An account associated with %{value} already exists'}
    validates :phone, length: {in: 7..15}, on: :create
    validates :address, length: {maximum: 100}

    include OrderableByTimestamp

    scope :is_active, -> { where(:active) }
    scope :no_active, -> { where(active: false) }


    enum genre: { company: 1, agent: 2, personal: 3, other: 4 }

    def self.ransackable_attributes(auth_object = nil)
        ["refno", "address", "id", "person", "name", "category", "status","phone"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

    self.per_page = 5
end
