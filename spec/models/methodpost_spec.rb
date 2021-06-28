require 'rails_helper'

RSpec.describe Methodpost, type: :model do
  before do
    @methodpost = FactoryBot.create(:methodpost)
  end

  describe '勉強法作成' do
    context '作成できるとき' do
      it 'user_id,title,cotent,subjectsが存在していれば作成できる' do
        expect(@methodpost).to be_valid
      end
      it 'titleが1文字以上なら登録できる' do
        @methodpost.title = 'あ'
        expect(@methodpost).to be_valid
      end
      it 'contentが1文字以上なら登録できる' do
        @methodpost.content = 'あ'
        expect(@methodpost).to be_valid
      end
    end

    context '勉強法作成できないとき' do
      it 'titleが空では登録できない' do
        @methodpost.title = ''
        @methodpost.valid?
        expect(@methodpost.errors.full_messages).to include 'タイトルを入力してください'
      end
      it 'contentが空では登録できない' do
        @methodpost.content = ''
        @methodpost.valid?
        expect(@methodpost.errors.full_messages).to include '内容を入力してください'
      end
    end
  end
end
