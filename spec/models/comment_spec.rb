require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)
  end

  # describe 'コメント作成' do
  #   context '作成できるとき' do
  #     it 'textが1文字以上なら登録できる' do
  #       @comment.text = 'あ'
  #       expect(@comment).to be_valid
  #     end
  #   end

  #   context '作成できないとき' do
  #     it 'textが空では登録できない' do
  #       @comment.text = ''
  #       @comment.valid?
  #       expect(@comment).to_not be_valid
  #     end
  #   end
  # end
end
