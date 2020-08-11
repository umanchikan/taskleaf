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


### herokuへのデプロイ方法
##### 使用したGemのバージョン

- ruby 2.6.5
- rails 5.2.4

以下の順番でターミナルへ打ち込む

`$heroku create`

`$git push heroku master`

`$heroku run rails db:migrate`
