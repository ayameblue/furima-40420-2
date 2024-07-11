require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order)
    @item_order = FactoryBot.build(:item)
    @item_order = FactoryBot.build(:user)
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

      it '都道府県が空だと保存できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
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

      it 'item_idが空だと保存できない' do
        @item_order.item_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空だと保存できない' do
        @item_order.user_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
