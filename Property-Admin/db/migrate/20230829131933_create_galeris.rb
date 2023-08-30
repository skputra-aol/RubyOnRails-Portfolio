class CreateGaleris < ActiveRecord::Migration[7.0]
  def change
    create_table :galeris do |t|
      t.string :title
      t.text :content
      t.belongs_to :Account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
