
# ローカルでの操作方法
開発環境の情報とクローンの生成コマンドを記載しています。

## 開発環境の情報は以下です。
- PC            :Catalina Version 10.15.7
- SHELL         :zsh
- Ruby on Rails :6.0.0
- Ruby          :2.7.2
- Mysql         :5.6.50

## クローン生成コマンドです。
- git clone https://github.com/shu26docutar/MemosukeOriginal
- bundle install
- rails db:create
- rails db:migrate
- rails s
- http://localhost:3000/


## ログイン詳細
- name: test
- email: test@test
- password: test01

# Association
## User
|  Column  |  Type  |              Options               |
| ------------------------------------------------------ |
| name     | string | null:false                         |
| email    | string | null:false,default:"",unique: true |
| password | string | null:false                         |
| birthday | date   | null:fase                          |

## Association
- has_many:sns_credentials
- has_many:posts
- has_many:events


## Sns_credentials
|  Column  |    Type    |      Options     |
| ---------------------------------------- |
| provider | string     |                  |
| uid      | string     |                  |
| user     | references | foreign_key:true |

## Association 
- belongs_to:user


## Post
|  Column  |    Type    |      Options     |
| ---------------------------------------- |
| title    | string     | null:false       |
| body     | text       |                  |
| user     | references | foreign_key:true |

## Association
- belongs_to:user


## Event
|   Column   |    Type    |      Options     |
| ------------------------------------------ |
| title      | string     | null:false       |
| plan       | string     |                  |
| comment    | string     |                  |
| url        | string     |                  |
| start_time | datetime   |                  |
| user       | references | foreign_key:true |

## Association
- belongs_to:user