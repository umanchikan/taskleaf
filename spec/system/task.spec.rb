require 'rails_helper'
require 'capybara/rspec'
describe 'タスク管理機能', type: :system do
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      task1 = FactoryBot.create(:task, title: "task", status: "complete")
      task2 = FactoryBot.create(:second_task, title: "sample", status: "incomplete")
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

__END__
  context 'タスクが作成日時の降順に並んでいる場合' do
    it '新しいタスクが一番上に表示される' do
      FactoryBot.create(:task, title: 'task1', content: "sample1", created_at: Time.current + 1.days)
      FactoryBot.create(:task, title: 'task2', content: "sample2", created_at: Time.current + 2.days)
      FactoryBot.create(:task, title: 'task3', content: "sample3", created_at: Time.current + 3.days)
      visit tasks_path
      task_list = all(".task_row")[0]
      expect(task_list).to have_content 'task3'
    end
  end
  context 'タスクが終了期限の降順に並んでいる場合' do
    it '終了期限の迫ったタスクが一番上に表示される' do
      FactoryBot.create(:task, title: 'task1', content: "sample1", expired_at: Time.current + 1.days)
      FactoryBot.create(:task, title: 'task2', content: "sample2", expired_at: Time.current + 2.days)
      FactoryBot.create(:task, title: 'task3', content: "sample3", expired_at: Time.current + 3.days)
      visit tasks_path
      task_list = all(".task_row")[0]
      expect(task_list).to have_content 'task3'
    end
  end
end
describe '新規作成機能' do
  context 'タスクを新規作成した場合' do
    it '作成したタスクが表示される' do
      # 1. new_task_pathに遷移する（新規作成ページに遷移する）
      visit new_task_path
      # 2. 新規登録内容を入力する
      fill_in 'タイトル', with: '燃えるゴミ'
      fill_in '詳細', with: '火曜日なり'
      #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      click_button '登録する'
      # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
      # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
      # ここにタスク詳細ページに、テストコードで作成したデータがタスク詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '燃えるゴミ'
      expect(page).to have_content '火曜日なり'
    end
  end
end
describe '詳細画面確認' do
  context '詳細画面に移動した際に' do
    it '該当タスクの内容が表示される' do
      task = FactoryBot.create(:task, title: 'task')
      visit task_path(task)
      expect(page).to have_content 'task'
    end
  end
end

