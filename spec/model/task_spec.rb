require 'rails_helper'
require 'capybara/rspec'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    before do
      FactoryBot.create(:task, title: "task")
      FactoryBot.create(:second_task, title: "sample")
    end
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト。タイトルなし')
        expect(task).not_to be_valid
      end
    end

    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '')
        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: 'テスト成功', content: 'テスト成功')
        expect(task).to be_valid
      end
    end
  end
end