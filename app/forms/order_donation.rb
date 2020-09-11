class OrderDonation

  include ActiveModel::Model
  attr_accessor :adressnumber, :area_id, :sichouson, :banchi, :bilding,:order_id, :phonenumber, :user_id, :item_id, :token

  validates :adressnumber, :area_id, :sichouson, :banchi,:item_id, :phonenumber, :token, presence: true
  validates :area_id ,numericality: { other_than: 1 }
  
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は郵便番号（「-」を含む且つ7桁）で入力してください' } do
    validates :adressnumber
  end

  with_options presence: true, format: { with: /\A\d{11}\z/, message: '電話番号は（「-」を除き11桁）で入力してください' } do
    validates :phonenumber
  end



  def save

    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 購入者情報の情報を保存
    Mailing.create(adressnumber: adressnumber, area_id: area_id, sichouson: sichouson, banchi: banchi, bilding: bilding, phonenumber: phonenumber, order_id: order.id)
  end

end