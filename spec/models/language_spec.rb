require 'rails_helper'

RSpec.describe Language, type: :model do
  before do
    @language = FactoryBot.build(:language)
  end

  describe '言語の保存' do
    context '保存できる場合' do
      it '必要な情報を適切に入力して「言語を作成」ボタンを押すと、言語情報がデータベースに保存される' do
        expect(@language).to be_valid
      end
    end
    context '保存できない場合' do
      it 'nameが空では保存できない' do
        @language.name = ''
        @language.valid?
        expect(@language.errors.full_messages).to include("Name can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @language.user = nil
        @language.valid?
        expect(@language.errors.full_messages).to include('User must exist')
      end
    end
  end
end
