class Mailing < ApplicationRecord
  belongs_to :order
  belongs_to_active_hash :area

  validates :adressnumber, :todouhuken_id, :sichouson, :banchi, presence: true
  validates :area_id ,numericality: { other_than: 1 }
  
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は郵便番号（「-」を含む且つ7桁）で入力してください' } do
    validates :adressnumber
  end

end
