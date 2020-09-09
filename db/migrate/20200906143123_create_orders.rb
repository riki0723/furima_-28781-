class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price  ,null: false

      belongs_to :user_id
      belongs_to :item_id

      t.timestamps
    end
  end
end
