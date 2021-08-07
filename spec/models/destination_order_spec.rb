require 'rails_helper'

RSpec.describe DestinationOrder, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @destination_order = FactoryBot.build(:destination_order, user_id: @user.id, item_id: @item.id)
      sleep 0.1 
    end

    context '商品購入できない時'  do
      it "post_codeがない場合は購入できないこと" do
        @destination_order.post_code = ''
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeは三桁未満ハイフン四桁未満の場合は購入できないこと" do
        @destination_order.post_code = '12-345'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁未満ハイフン四桁超過の場合は購入できないこと" do
        @destination_order.post_code = '12-34563'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁超過ハイフン四桁未満の場合は購入できないこと" do
        @destination_order.post_code = '1234-345'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁超過ハイフン四桁超過の場合は購入できないこと" do
        @destination_order.post_code = '1222-34562'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁未満ハイフン四桁の場合は購入できないこと" do
        @destination_order.post_code = '12-3456'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁超過ハイフン四桁の場合は購入できないこと" do
        @destination_order.post_code = '1222-3456'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁ハイフン四桁未満の場合は購入できないこと" do
        @destination_order.post_code = '122-345'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは三桁ハイフン四桁超過の場合は購入できないこと" do
        @destination_order.post_code = '122-34567'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは全角数字の場合は購入できないこと" do
        @destination_order.post_code = '１２３−４５６７'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは全角ひらがなの場合は購入できないこと" do
        @destination_order.post_code = 'あああーああああ'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは全角カタカナの場合は購入できないこと" do
        @destination_order.post_code = 'カタカーカタカナ'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは漢字の場合は購入できないこと" do
        @destination_order.post_code = '漢字漢ー字漢字間'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは全角英字の場合は購入できないこと" do
        @destination_order.post_code = 'kjkーkjkj'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "post_codeは半角英字の場合は購入できないこと" do
        @destination_order.post_code = 'kjk-jkjk'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Post code is invalid")
      end

      it "prefecture_idが未選択の場合は購入できないこと" do
        @destination_order.prefecture_id = 1
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityがない場合は購入できないこと" do
        @destination_order.city = ''
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("City can't be blank")
      end

      it "street_numberがない場合は購入できないこと" do
        @destination_order.street_number = ''
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Street number can't be blank")
      end

      it "phone_numberがない場合は購入できないこと" do
        @destination_order.phone_number = ''
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは10桁未満では購入できないこと" do
        @destination_order.phone_number = '090111122'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは11桁超過では購入できないこと" do
        @destination_order.phone_number = '090111122222'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは全角数字では購入できないこと" do
        @destination_order.phone_number = '０９０１２３４５６７８'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは全角かなでは購入できないこと" do
        @destination_order.phone_number = 'あああああああああああ'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは漢字では購入できないこと" do
        @destination_order.phone_number = '零九零一二三四五六七八'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは全角カナでは購入できないこと" do
        @destination_order.phone_number = 'アアアアアアアアアアア'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは全角英字では購入できないこと" do
        @destination_order.phone_number = 'kjkjkjkjkjk'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは半角英字では購入できないこと" do
        @destination_order.phone_number = 'oqoioiooooo'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberはハイフンがあると購入できないこと" do
        @destination_order.phone_number = '090-1234-5678'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenがない場合は購入できないこと" do
        @destination_order.token = ''
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '商品購入できる時' do
      it "post_code,prefecture_id,city,street_number,building_name,phone_number,tokenがある時購入できる" do
        expect(@destination_order).to be_valid
      end

      it "building_nameがなくても購入できる" do
        @destination_order.building_name = ''
        expect(@destination_order).to be_valid
      end
    end
  end
end
