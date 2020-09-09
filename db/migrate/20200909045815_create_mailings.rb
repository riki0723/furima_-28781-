class CreateMailings < ActiveRecord::Migration[6.0]
  def change
    create_table :mailings do |t|

      t.string :adressnumber
      t.integer :area_id
      t.string :sichouson
      t.string :banchi
      t.string :bilding
      

      t.timestamps
    end
  end
end
