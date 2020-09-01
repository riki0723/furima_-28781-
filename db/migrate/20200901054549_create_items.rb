class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.text :explation
      t.integer :category
      t.integer :status
      t.integer :integer
      t.integer :area
      t.integer :days
      t.integer :price
      t.integer :user_id
      

      t.timestamps
    end
  end
end
