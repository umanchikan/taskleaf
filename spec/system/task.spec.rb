require 'rails_helper'
require 'capybara/rspec'
describe 'タスク管理機能', type: :system do
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, title: "task", status: "complete")
      FactoryBot.create(:second_task, title: "sample", status: "incomplete")
    end
    context 'タイトルあいまい検索をした場合' do
      it '検索キーワードを含むタスクで絞り込まれる' do
        visit tasks_path
        fill_in 'task_title', with: 'task'
        click_button 'Search'
        expect(page).to have_content 'task'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        within '.status_search' do
          select 'complete'
        end
        click_button 'Search'
        expect(page).to have_content 'complete'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'task_title', with: 'task'
        within '.status_search' do
          select 'complete'
        end
        click_button 'Search'
        expect(page).to have_content "task"
        expect(page).to have_content "complete"
      end
    end
  end
end


