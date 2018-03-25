# NAME (名前)
teleport - テレポート


# SYNOPSIS (概要)
* チェックインチェックアウトをGPS情報とともに管理するプラットフォーム

## URL (サイトのアドレス)
teleport.iteenslab.com/ - (仮)

## START APP

アプリケーションスタート

### お手元の PC

```
(WEBフレームワークを起動 development モード)
$ carton exec -- morbo script/teleport

(終了時は control + c で終了)
```

コマンドラインで morbo サーバー実行後、web ブラウザ `http://localhost:3000/` で確認

# EXAMPLES (例)
```
http://teleport.iteenslab.com/check/create - (チェックイン画面表示)
```

# DESCRIPTION (詳細)
## アクションURL
### ユーザー作成、ログイン一式
- GET - `/index` -index  - トップページ
```
画面名
    トップページ
ログインボタン->ログイン入力ボタンへ
新規登録ボタン->ユーザー登録画面へ
```

- GET - `/auth/create` - create - ユーザー登録画面
```
画面名
    ユーザー登録画面
入力フォーム
    ユーザーID (user.login_id)
    名前 (user.name)
    パスワード (user.password)
登録ボタン->登録後、アプリトップページへ
```

- GET - `/auth/:id/edit` - edit ユーザー情報変更画面
```
画面名
    ユーザー情報変更画面
※ログイン後であること
表示項目
    ユーザーID (user.login_id)
    名前 (user.name)
入力フォーム
    名前 (user.name)
    パスワード (user.password)
登録ボタン->登録後メニュートップページへ
アプリトップボタン->アプリトップへ
```

- GET - `/auth/:id` - show ユーザー情報詳細
```
画面名
    ユーザー情報詳細
表示項目
    ユーザーID (user.login_id)
    名前 (user.name)
    パスワード (user.password)->値は表示しない*で表示
変更ボタン->ユーザー情報変更画面へ
削除ボタン->ユーザー削除画面へ
アプリトップボタン->アプリトップへ
```

- GET - `/auth` - index - ログイン入力画面
```
画面名
    ログイン入力画面
入力フォーム
    ユーザーID (user.user_id)
    パスワード (user.password)
ログインボタン->ログイン完了後トップページへ
```

- GET - `/menu` - index - アプリトップメニュー
```
ログアウトボタン->ログアウト完了画面へ
チェックイン機能ボタン->チェックイン画面表示へ
ユーザー情報->ユーザー情報詳細
```

- GET - `/auth/logout` - logout - ログアウト完了画面
```
画面名
    ログアウト画面
トップページボタン->トップページへ
```

- GET - `/auth/remove` - remove ユーザー削除画面
```
画面名
    ユーザー削除画面
※ログイン中であることが条件
削除ボタン->確認ダイアログ表示->削除後、画面遷移し「削除しました」表示＋トップページボタン
```

- POST - `/auth/login` - login - ユーザーログイン実行
```
ログイン実行のリクエスト
    成功：「ログインしました」->ログイン後のトップメニューへ
    失敗：エラーメッセージを表示、入力済みの情報はFill In->画面遷移無し
```

- POST - `/auth/logout` - logout - ユーザーログアウト実行
```
ログアウト実行のリクエスト
    成功：「ログアウトしました」->アプリトップメニューへ
    失敗：エラーメッセージ表示->画面遷移無し
```

- POST - `/auth/:id/update` - update ユーザー情報変更実行
```
ユーザー情報変更実行のリクエスト
※ログイン中であることが条件
    成功：「変更しました」->トップメニューへ
    失敗：エラーメッセージ表示->画面遷移無し
```

- POST - `/auth/:id/remove` - remove ユーザー削除実行
```
ユーザー削除実行のリクエスト
※ログイン中であることが条件
    成功：「削除しました」->ユーザー削除完了画面へ
    失敗：エラーメッセージ表示->画面遷移無し
```

- POST - `/auth` - store ユーザー新規登録実行
```
ユーザー新規登録実行のリクエスト
    成功：「登録しました」->ログイン完了後のトップメニューへ
    失敗：エラーメッセージ表示、入力済みの情報はFill In->画面遷移無し
```


### チェックイン・チェックアウト

- GET - `/check/create` - create - チェックイン画面表示
```
画面名
    チェックイン画面表示
※ログイン中であることが条件
表示項目
    位置情報 チェックを入れる (teleport.gps)
    日時(でっかく表示)
チェックインボタン->押下でチェックインボタンが非活性になる。->アプリトップページへ画面が遷移する
チェックアウトボタン->押下でチェックアウトボタンが非活性になる。->アプリトップページへ画面が遷移する
チェックイン中一覧ボタン->これからつくる
アプリトップボタン->アプリトップへ
```

- GET - `/check/list` - list - チェックイン中一覧
```
画面名
    チェックイン中一覧
表示項目
    日時
    ID(user.login_id)
    名前(user.name)
    チェックイン時刻
    場所(teleport.gps)
アプリトップボタン->アプリトップへ
```


- POST - `/check` - store - チェックをつけてボタン押下※チェックしないとチェックインができないようにする (チェックインボタン、チェックアウトボタン)
```
チェックイン実行のリクエスト
※ログイン中であることが条件
  成功：「チェックインしました」-アプリトップメニューへ
  失敗：エラーメッセージ表示、入力済みの情報はFill In->画面遷移無し
```


## DB 設計

```sql
-- ログインユーザーのテーブル
DROP TABLE IF EXISTS user;
CREATE TABLE user (                                     -- ユーザー
    id              INTEGER PRIMARY KEY AUTOINCREMENT,  -- ID (例: 5)
    login_id        TEXT,                               -- ログインID名 (例: 'hackerz@gmail.com')
    password        TEXT,                               -- ログインパスワード (例: 'hackerz')
    name            TEXT,                               -- 名前 (例: 'おそまつ')
    approved        INTEGER,                            -- 承認フラグ (例: 0: 承認していない, 1: 承認済み)
    deleted         INTEGER,                            -- 削除フラグ (例: 0: 削除していない, 1: 削除済み)
    created_ts      TEXT,                               -- 登録日時 (例: '2016-01-08 12:24:12')
    modified_ts     TEXT                                -- 修正日時 (例: '2016-01-08 12:24:12')
);
-- チェックインチェックアウトのテーブル
DROP TABLE IF EXISTS teleport;
CREATE TABLE teleport (                                 -- 位置情報付きのチェックイン記録
    id              INTEGER PRIMARY KEY AUTOINCREMENT,  -- ID (例: 5)
    user_id         TEXT,                                -- ユーザーID名 (例: 2)
    gps             TEXT,                               -- 位置情報 (例: '33.6065756,130.418297')
    status          TEXT,                               -- チェックインステータス (例: 10: チェックイン, 20: チェックアウト)
    stamp_ts        TEXT,                               -- 打刻日時 (例: '2016-01-08 12:24:12')
    deleted         INTEGER,                            -- 削除フラグ (例: 0: 削除していない, 1: 削除済み)
    created_ts      TEXT,                               -- 登録日時 (例: '2016-01-08 12:24:12')
    modified_ts     TEXT                                -- 修正日時 (例: '2016-01-08 12:24:12')
);
```

# TODO (課題)
## 次回課題
* 画面の実装前の画面仕様書作成(アクションURL毎の仕様書)

# SEE ALSO (参考)
* https://docs.google.com/presentation/d/1zcDF2uZsRGIZhK9C9Wew32wNs_VKZjYDV_B0f_0x3lA/edit#slide=id.g30ecfd2647_0_48 - テレポートアプリに関する資料
