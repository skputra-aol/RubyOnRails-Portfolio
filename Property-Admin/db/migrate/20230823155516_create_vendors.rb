class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.integer :refno
      t.string :name
      t.string :person
      t.string :phone
      t.string :address
      t.boolean :status
      t.string :category

      t.timestamps
    end
  end
end
