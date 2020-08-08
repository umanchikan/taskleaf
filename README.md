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