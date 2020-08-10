User
| カラム名  | データ型  |
| ---- | ----------- | 
| id    |integer | 
| name   | string| 
| email  | string | 

Task
| カラム名   | データ型  |
| ---- | --------------- | 
| id    |integer | 
| name  | string |
| user_id   | integer| 
| content| string | 

Labeling
| カラム名   | データ型  |
| ---- | --------------- | 
| id    |integer | 
| task_id   | integer| 
| label_id   | integer| 


Label
| カラム名   | データ型  |
| ---- | --------------- | 
| id    |integer | 
| name | string | 

###herokuへのデプロイ方法
#####使用したGemのバージョン
- ruby 2.6.5
- rails 5.2.4

1. `$heroku create`とターミナルへ入力する(アプリが作られる)

2. `$git push heroku master`とターミナルへ入力する

3.`$heroku run rails db:migrate`とターミナルへ入力する
