# アプリケーション名
 MemoSuke

# アプリケーションの概要
手帳のように管理ができるWebアプリケーションです。基本機能（作成・編集・削除）だけでなく、マークダウン方式でメモをわかりやすくまとめることができます。
万が一、メモ情報が多くなった場合は検索機能で簡潔して見つけることができる機能もあります。
また、画面にはカレンダーが掲載されております。スケジュールを登録することができ、メモ・スケジュールを並行して管理が可能なWebアプリケーションです。

# URL
- https://memosuke-original.herokuapp.com/

# テスト用アカウント
- name     :服部楓平    
- email    :test1@test 
- password :test01     

# 利用方法
- 新規登録・ログイン 新規登録もしくは、ログインを行います。
- ルームの作成 新規登録・ログインが完了しましたら、メモを投稿します。ヘッダーのボタン左から２番目を押すと、メモ投稿フォームが出てきます。ここにtitleをいれ、bodyにマークダウン方式で記述することでメモを綺麗に整えながらメモを作成することができます。メモを作成したら、左側にメモのルームが作成されます。ここから作成したメモの詳細・編集・削除をすることができます。
- カレンダーの使用方法,ヘッダーの右から２番目を押すと、スケジュールの登録フォームに画面遷移します。はじめに出てくる入力欄はスケジュールを追加する上で必要な物を先に表示しています。フォーム下部にある（メモ・場所・URL）は必要になった場合にボタンを押すことで入力欄を追加することができるオプションです。入力後、保存ボタンを押すことでカレンダーにスケジュールが反映されます。詳細を見る際は、カレンダーのスケジュール名をクリックすることで表示されます。
- メモの検索機能、メモを大量に作成した場合、情報が多くなり探すことに手間がかかってしまいます。ヘッダーの左から１番目を押すことでその問題を解決します。虫眼鏡をクリックしていただきますと、検索蘭が出現します。ここに曖昧検索でメモのタイトルを入力することで、期待している結果を取得することができる様になっています。

# 目指した課題解決
出勤や外出で手帳やメモを持ち歩くと荷物が多くなってしまったり忘れることもあり、まとめることができなくなってしまいます。 pcを用いて仕事をする方に、一つの画面で時間のロス・正しいスケジュールの管理・精神的負担を取り除くとこができるようにすることです。

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
| -------- | ------ | ---------------------------------- |
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
| -------- | ---------- | ---------------- |
| provider | string     |                  |
| uid      | string     |                  |
| user     | references | foreign_key:true |

## Association 
- belongs_to:user


## Post
|  Column  |    Type    |      Options     |
| -------- | ---------- | ---------------- |
| title    | string     | null:false       |
| body     | text       |                  |
| user     | references | foreign_key:true |

## Association
- belongs_to:user


## Event
|   Column   |    Type    |      Options     |
| ---------- | ---------- | ---------------- |
| title      | string     | null:false       |
| plan       | string     |                  |
| comment    | string     |                  |
| url        | string     |                  |
| start_time | datetime   |                  |
| user       | references | foreign_key:true |

## Association
- belongs_to:user