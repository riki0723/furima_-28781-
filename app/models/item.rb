class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :image, :name, :explation, :category_id, :status_id, :delivery_id, :area_id, :days_id, presence: true

  validates :category_id, :status_id, :delivery_id, :area_id, :days_id, numericality: { other_than: 1 } 

  with_options presence: true, format: { with: /\A[300-9999999]+\d\z/, message: 'は300〜9999999円の間で設定してください' } do
    validates :price_id
  end



end
