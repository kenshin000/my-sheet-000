require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿情報の保存' do
    context '保存できる場合' do
      it '必要な情報を適切に入力して「投稿」ボタンを押すと、投稿情報がデータベースに保存される' do
        expect(@post).to be_valid
      end
    end

    context '保存できない場合' do
      it 'titleが空では保存できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では保存できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
