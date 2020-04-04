class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, default: ''
      t.decimal :price, default: 0
      t.string :image, default: ''

      t.timestamps
    end
  end
end
