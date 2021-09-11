require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end
  describe '購入者情報入力' do
    context '購入者情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@buyer_address).to be_valid
      end
    end
    context '購入者情報の入力がうまく行かない時' do
      it "tokenが空では登録できないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが未選択だと購入できない' do
        @buyer_address.postcode = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが未選択だと購入できない' do
        @buyer_address.prefecture_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが未選択だと購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
      end
      it 'blockが未選択だと購入できない' do
        @buyer_address.block = ''
        @buyer_address.valid?
      end
      it 'buildingの入力なくても登録できる' do
        @buyer_address.building = ''
        @buyer_address.valid?
      end
      it 'phone_numberが空だと購入できない' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postcodeにはハイフンが必要であること' do
        @buyer_address.postcode = 1234567
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'phone_numberは11桁以内の数値のみ保存可能なこと' do
        @buyer_address.phone_number = '080123451234'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは9桁以下では購入できない' do
        @buyer_address.phone_number = '090123123'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数字以外が含まれる場合では購入できない' do
        @buyer_address.phone_number = '０９０１２３４５６７'
        @buyer_address.valid?
      end
    end
  end
end
