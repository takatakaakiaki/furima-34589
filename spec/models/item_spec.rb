require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が入力されているなら出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品の出品ができない場合' do
      it '商品画像が空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では出品できないこと' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'カテゴリーが空では出品できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'カテゴリーがid:1では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が空では出品できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it '商品の状態がid:1では出品できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担が空では出品できないこと' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
      end

      it '配送料の負担がid:1では出品できないこと' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      
      it '発送元の地域が空では出品できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it '発送元の地域がid:1では出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が空では出品できないこと' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank", "Schedule is not a number")
      end

      it '発送までの日数がid:1では出品できないこと' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule must be other than 1")
      end

      it '販売価格が空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Out of setting range")
      end

      it '販売価格が300円未満では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格が10000000円以上では出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格が全角数字では出品できないこと' do
        @item.price = '５００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
