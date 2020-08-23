require 'rails_helper'
require 'capybara/rspec'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    task = FactoryBot.create(:task, title: 'task', status: "complete")
    second_task = FactoryBot.create(:second_task, title: "sample", status: "incomplete")
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it '検索キーワードを含むタスクが絞り込まれる' do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.search_title('task')).to include(task)
        expect(Task.search_title('task')).not_to include(second_task)
        expect(Task.search_title('task').count).to eq 1
      end
    end
  end
end
