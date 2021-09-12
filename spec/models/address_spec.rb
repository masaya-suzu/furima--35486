require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '購入者情報入力' do
    context '購入者情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@address).to be_valid
      end
    end
    context '購入者情報の入力がうまく行かない時' do
      it 'postcodeが未選択だと購入できない' do
        @address.postcode = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'prefecture_idが未選択だと購入できない' do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'cityが未選択だと購入できない' do
        @address.city = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'blockが未選択だと購入できない' do
        @address.block = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'phone_numberが空だと購入できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'postcodeにはハイフンが必要であること' do
        @address.postcode = 1234567
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
      it 'phone_numberは11桁以内の数値のみ保存可能なこと' do
        @address.phone_number = '080123451234'
        @address.valid?
        expect(@address.errors.full_messages).to include("Buyer must exist")
      end
    end
  end
end
