require 'rails_helper'
require 'capybara/rspec'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    #FactoryBot.create(:task, title: 'task', status: "complete")
    #FactoryBot.create(:second_task, title: "sample", status: "incomplete")
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      before do
        FactoryBot.create(:task, title: "task")
        FactoryBot.create(:second_task, title: "sample")
      end
      it '検索キーワードを含むタスクが絞り込まれる' do
        expect(Task.search_title('task').count).to eq 1
      end
      end
      context "scopeメソッドでステータス検索をした場合" do
        before do
          FactoryBot.create(:task, title: "task", status: "complete")
          FactoryBot.create(:second_task, title: "sample", status: "incomplete")
        end
        it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_status('complete').count).to eq 1
        end
      end
      context "scopeメソッドでタイトルのあいまい検索とステータス検索をした場合" do
        before do
          FactoryBot.create(:task, title: "task", status: "complete")
          FactoryBot.create(:second_task, title: "sample", status: "incomplete")
        end
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          expect(Task.search_title('task').count).to eq 1
          expect(Task.search_status('complete').count).to eq 1
        end
      end
  end
end

