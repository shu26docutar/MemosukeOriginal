# アプリケーション名
 MemoSuke

# アプリケーションの概要
手帳のように管理ができるWebアプリケーションです。基本機能（作成・編集・削除）だけでなく、マークダウン方式でメモをわかりやすくまとめることができます。
万が一、メモ情報が多くなった場合は検索機能で簡潔して見つけることができる機能もあります。
また、画面にはカレンダーが掲載されております。スケジュールを登録することができ、メモ・スケジュールを並行して管理が可能なWebアプリケーションです。

# URL
- https://memosuke-original.herokuapp.com/

# テスト用アカウント
|name     | 服部楓平    |
|email    | test1@test |
|password | test01     |

# 利用方法
- 新規登録・ログイン 新規登録もしくは、ログインを行います。
- ルームの作成 新規登録・ログインが完了しましたら、ロゴの左下にある＋ボタンで新規ルームフォームに画面遷移いたします。 ルーム名を入力し、メモのルームを作成することができます。ルームを作成すると、左側にルームが表示されます。
- ルームの削除 ルーム名にカーソルを乗せると削除ボタンが現れます。削除ボタンを押すと、ルームとメモを共に削除することができます。
- メモの作成 作成したルームを押すことで、メモの追加が可能になります。中央のメモ入力欄にメモを入力し、保存ボタンを押すとメモが保存されます。複数ルームを作成した場合選択したルームでメモを保存することができます。そのことによりルームをメモの種類毎に分けることができます。
- カレンダーの使用方法 カレンダーの上記の＋ボタンを押すと、カレンダーにスケジュールを追加することができます。スケジュールを登録する時に任意で時間とスケジュールのタイトルを指定することができます。オプションでコメント・場所・urlを入力することができ、それぞれをスケジュールのメモとして活用いただけます。 カレンダーに表示されているスケジュール名をクリックするとスケジュールを確認することが可能になります。

# 目指した課題解決
出勤や外出で手帳やメモを持ち歩くと荷物が多くなってしまったり忘れることもあり、まとめることができなくなってしまいます。 pcを用いて仕事をする方に、一つの画面で時間のロス・正しいスケジュールの管理・精神的負担を取り除くとこができるようにすることです。

# 洗い出した要件定義

# 実装予定の機能
- 検索機能です。メモを大量生成した後は見つけ出すことに時間が発生してしまいます。検索で調べる時間を減らせることができる検索機能を追加します。

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