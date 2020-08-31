require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、passwordとpassword_confirmation,familyname,firstname,familykana,firstkana,berthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上かつ半角英数字であれば登録できる" do
       @user.password = "aaa000"
       @user.password_confirmation = "aaa000"
       expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "familynameが空では登録できない" do
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "familykanaが空では登録できない" do
        @user.familykana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のカナを入力してください")
      end
      it "firstnameが空では登録できない" do
        @user.firstkana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のカナを入力してください")
      end

      it "berthdayが空では登録できない" do
        @user.berthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
