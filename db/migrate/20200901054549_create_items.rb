class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.text :explation
      t.integer :category_id
      t.integer :status_id
      t.integer :integer_id
      t.integer :area_id
      t.integer :days_id
      t.integer :price_id
      t.integer :user_id
      

      t.timestamps
    end
  end
end
