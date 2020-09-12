require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    # item = item.find(params[:id])
    # user = user.find(params[:id])
    syupin_user = FactoryBot.create(:user)
    # user = FactoryBot.build(:user)
    # user.valid?
    # binding.pry
    kounyu_user = FactoryBot.create(:user)

    item =FactoryBot.build(:item, user_id: syupin_user.id)
    @order = FactoryBot.build(:order_donation, item_id: item.id, user_id: kounyu_user.id)
  end

  describe '商品の購入' do
    context "商品の購入の保存できる場合" do

      it "全てのがあれば商品の購入が保存は保存される" do
        expect(@order).to be_valid
      end

    end
    context "商品の購入が保存できない場合" do
      it "トークンが無いと商品の購入は保存できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Tokenを入力してください")
      end

      it "郵便番号が無いと商品の購入は保存できない" do
        @order.adressnumber = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Adressnumberを入力してください")
      end

      it "都道府県が無いと商品の購入は保存できない" do
        @order.area_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Areaを入力してください")
      end

      it "市町村が無いと商品の購入は保存できない" do
        @order.sichouson = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Sichousonを入力してください")
      end

      it "電話号が無いと商品の購入は保存できない" do
        @order.phonenumber = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber電話番号は（「-」を除き11桁）で入力してください")
      end

      it "郵便番号に「-」が無いと商品の購入は保存できない" do
        @order.adressnumber = "000111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Adressnumberは郵便番号（「-」を含む且つ7桁）で入力してください")
      end

      it "電話が１１桁以下だと商品の購入は保存できない" do
        @order.phonenumber = "090111222"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber電話番号は（「-」を除き11桁）で入力してください")
      end


      it "電話号に「-」が入ってると商品の購入は保存できない" do
        @order.phonenumber = "090-1111-2222"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber電話番号は（「-」を除き11桁）で入力してください")
      end



    end
  end
end
