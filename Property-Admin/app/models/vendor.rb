class Vendor < ApplicationRecord
    enum genre: { company: 1, agent: 2, personal: 3, other: 4 }

    def self.ransackable_attributes(auth_object = nil)
        ["refno", "address", "id", "person", "name", "category", "status","phone"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

end
