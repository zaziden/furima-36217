require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できない時'  do
      it "nikcnameがない場合は登録できないこと" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
 
      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
 
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
 
      it "family_nameがない場合は登録できないこと" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
 
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
 
      it "family_name_kanaがない場合は登録できないこと" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
 
      it "birth_dayがない場合は登録できないこと" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'passwordがない場合は登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
 
      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
 
      it " 重複したemailが存在する場合は登録できないこと " do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは、@を含む必要があること。" do
        @user.email = 'nnnnnnnnn'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
 
      it " passwordが5文字以下であれば登録できないこと " do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it " パスワードは、半角数字のみだと登録できないこと " do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it " パスワードは半角英字のみだと登録できないこと " do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it " パスワードは全角英数字だと登録できないこと " do
        @user.password = 'aaaa１２３４'
        @user.password_confirmation = 'aaaa１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.family_name = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_name_kanaは、全角（カタカナ）での入力が必須であること。" do
        @user.first_name_kana = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaは、全角かつカタカナでないと登録できない。" do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "family_name_kanaは、全角（カタカナ）での入力が必須であること。" do
        @user.family_name_kana = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it "family_name_kanaは、全角かつカタカナでないと登録できないこと。" do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
    end

    context '新規登録できる時' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、family_name、first_name_kana、family_name_kana、birth_dayが存在すれば登録できること" do
      expect(@user).to be_valid
      end
    end
  end
end
