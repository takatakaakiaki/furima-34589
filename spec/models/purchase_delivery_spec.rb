require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context '商品を購入できる場合' do
      it 'カード情報(token)、郵便番号、都道府県、市区町村、番地、建物名、電話番号が入力されているなら購入できる' do
        expect(@purchase_delivery).to be_valid
      end      
    end
  
    context '商品を購入できない場合' do
      it 'カード情報(token)が空だと購入できないこと' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できないこと' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
    
      it '郵便番号はハイフンがないと購入できないこと' do
        @purchase_delivery.postal_code = 1234567
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県を選択しないと購入できないこと' do
        @purchase_delivery.prefecture_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture is not a number")
      end

      it '市区町村が空だと購入できないこと' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できないこと' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it '建物名が空だと購入できないこと' do
        @purchase_delivery.building = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Building can't be blank")
      end

      it '電話番号が空だと購入できないこと' do
        @purchase_delivery.tell = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Tell can't be blank")
      end
    end
  end
end
