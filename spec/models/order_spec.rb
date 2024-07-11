require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報が保存できる時' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@item_order).to be_valid
      end
      it '建物名は任意である' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    end
    context '商品購入情報が保存できない時' do
      it 'クレジットカード情報が空だと保存できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できない' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」でなければ保存できない' do
        @item_order.post_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid")
      end

      it '郵便番号は全角では保存できない' do
        @item_order.post_code = '123ー4567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が空だと保存できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県がidが1だと保存できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市町村が空だと保存できない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @item_order.street = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は9桁以下では保存できない' do
        @item_order.phone_number = '090123456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は12桁以上では保存できない' do
        @item_order.phone_number = '090123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は全角だと保存できない' do
        @item_order.phone_number = '０９０１２３４５６７８'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end