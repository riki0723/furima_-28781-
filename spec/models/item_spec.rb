require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品の出品が保存できる場合" do

      it "画像,商品名、商品の説明、カテゴリー、商品の状態、送料の負担、発送元の地域、日数、価格、があれば商品の出品が保存は保存される" do
        expect(@item).to be_valid
      end

    end
    context "商品の出品が保存できない場合" do
      it "画像がないと商品の出品は保存できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it "商品名がないと商品の出品は保存できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "商品の説明がないと商品の出品は保存できない" do
        @item.explation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it "カテゴリーがないと商品の出品は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it "商品の状態がないと商品の出品は保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it "配送料の負担がないと商品の出品は保存できない" do
        @item.delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を入力してください")
      end

      it "発送元の地域がないと商品の出品は保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it "発送までの日数がないと商品の出品は保存できない" do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("発送まで日数の地域を入力してください")
      end

      it "価格がないと商品の出品は保存できない" do
        @item.price_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end


      it "価格が全角だと商品の出品は保存できない" do
        @item.price_id = "９９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を半角にしてください")
      end


      it "ユーザーが紐ついていないと商品の出品は保存できない" do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ログインしてください")
      end
    end
  end
end
