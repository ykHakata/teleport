# NAME

teleport/controller/auth - Teleport

# SYNOPSIS

## URL

### ユーザー作成、ログイン一式

- GET - `/auth/create` - create - ユーザー登録画面
- GET - `/auth/:id/edit` - edit - ユーザー情報変更画面
- GET - `/auth/:id` - show - ユーザー情報詳細
- GET - `/auth` - index - ログイン入力画面
- GET - `/auth/logout` - logout - ログアウト完了画面
- GET - `/auth/remove` - remove - ユーザー削除画面
- POST - `/auth/login` - login - ユーザーログイン実行
- POST - `/auth/logout` - logout - ユーザーログアウト実行
- POST - `/auth/:id/update` - update - ユーザー情報変更実行
- POST - `/auth/:id/remove` - remove - ユーザー削除実行
- POST - `/auth` - store - ユーザー新規登録実行

# DESCRIPTION

## GET - `/index` -index  - トップページ
```
画面名
    トップページ
ログインボタン->ログイン入力ボタンへ
新規登録ボタン->ユーザー登録画面へ
```

## - GET - `/auth/create` - create - ユーザー登録画面

```
画面名
    ユーザー登録画面
入力フォーム
    ユーザーID (user.login_id)
    名前 (user.name)
    パスワード (user.password)
登録ボタン->登録後、アプリトップページへ
```

## - GET - `/auth/:id/edit` - edit - ユーザー情報変更画面

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

## - GET - `/auth/:id` - show - ユーザー情報詳細

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

## - GET - `/auth` - index - ログイン入力画面

```
画面名
    ログイン入力画面
入力フォーム
    ユーザーID (user.user_id)
    パスワード (user.password)
ログインボタン->ログイン完了後トップページへ
```

## GET - `/menu` - index - アプリトップメニュー
```
ログアウトボタン->ログアウト完了画面へ
チェックイン機能ボタン->チェックイン画面表示へ
ユーザー情報->ユーザー情報詳細
```

## - GET - `/auth/logout` - logout - ログアウト完了画面

```
画面名
    ログアウト画面
トップページボタン->トップページへ
```

## - GET - `/auth/remove` - remove - ユーザー削除画面

```
画面名
    ユーザー削除画面
※ログイン中であることが条件
削除ボタン->確認ダイアログ表示->削除後、画面遷移し「削除しました」表示＋トップページボタン
```

## - POST - `/auth/login` - login - ユーザーログイン実行

```
ログイン実行のリクエスト
    成功：「ログインしました」->ログイン後のトップメニューへ
    失敗：エラーメッセージを表示、入力済みの情報はFill In->画面遷移無し
```

## - POST - `/auth/logout` - logout - ユーザーログアウト実行

```
ログアウト実行のリクエスト
    成功：「ログアウトしました」->アプリトップメニューへ
    失敗：エラーメッセージ表示->画面遷移無し
```

## - POST - `/auth/:id/update` - update - ユーザー情報変更実行

```
ユーザー情報変更実行のリクエスト
※ログイン中であることが条件
    成功：「変更しました」->トップメニューへ
    失敗：エラーメッセージ表示->画面遷移無し
```

## - POST - `/auth/:id/remove` - remove - ユーザー削除実行

```
ユーザー削除実行のリクエスト
※ログイン中であることが条件
    成功：「削除しました」->ユーザー削除完了画面へ
    失敗：エラーメッセージ表示->画面遷移無し
```

## - POST - `/auth` - store - ユーザー新規登録実行

```
ユーザー新規登録実行のリクエスト
    成功：「登録しました」->ログイン完了後のトップメニューへ
    失敗：エラーメッセージ表示、入力済みの情報はFill In->画面遷移無し
```

# TODO

```
- GET - `/example/create` - create
- GET - `/example/search` - search
- GET - `/example` - index
- GET - `/example/:id/edit` - edit
- GET - `/example/:id` - show
- POST - `/example` - store
- POST - `/example/:id/update` - update
- POST - `/example/:id/remove` - remove
```

# SEE ALSO

- `lib/Teleport/Controller/Auth.pm` -
- `lib/Teleport/Model/Auth.pm` -
- `templates/auth/index.html.ep` -
- `t/teleport/controller/auth.t` -
