class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.integer :property_id
      t.integer :vendor_id
      t.integer :pin_id
      t.string :tag_no
      t.boolean :available
      t.string :note

      t.timestamps
    end
  end
end
