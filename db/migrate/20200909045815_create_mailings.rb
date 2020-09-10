class CreateMailings < ActiveRecord::Migration[6.0]
  def change
    create_table :mailings do |t|

      t.string :adressnumber ,null: false
      t.integer :area_id ,null: false
      t.string :sichouson ,null: false
      t.string :banchi ,null: false
      t.string :bilding ,null: false
      t.string :phonenumber ,null: false
      

      t.timestamps
    end
  end
end
