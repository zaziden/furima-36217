require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できない時'  do
      it "nameがない場合は出品できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it "imageがない場合は出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it "descriptionがない場合は出品できないこと" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
  
      it "categoryが未選択だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
  
      it "item_condition_idが未選択だと出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
  
      it "delivery_charge_idが未選択だと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
  
      it "area_idが未選択だと出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
  
      it "preparation_day_idが未選択だと出品できない" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
  
      it "priceがないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it "priceは、300以上での入力でないと出品できないこと" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、9999999以下での入力でないと出品できないこと" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、全角数字では出品できない" do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、全角ひらがなでは出品できない" do
        @item.price = 'にせんえん'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、漢字では出品できない" do
        @item.price = '二千円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、全角カタカナでは出品できない" do
        @item.price = 'ニセンエン'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは、半角英字では出品できない" do
        @item.price = 'nisennenn'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  
    context '商品出品できる時' do
      it "name,image,description,category_id,item_condition_id,delivery_charge_id,area_id,preparation_day_id,priceがあれば出品できる" do
        expect(@item).to be_valid
      end
    end
  end
end