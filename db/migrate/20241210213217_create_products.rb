class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end
