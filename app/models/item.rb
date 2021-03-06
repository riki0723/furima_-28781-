class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  has_one :order



  validates :image, :name, :explation, :category_id, :status_id, :delivery_id, :area_id, :days_id, presence: true

  validates :category_id, :status_id, :delivery_id, :area_id, :days_id, numericality: { other_than: 1 } 

  with_options presence: true, format: { with: /\A[300-9999999]+\d\z/, message: 'は300〜9999999円の間で設定してください' } do
    validates :price_id
  end



end
