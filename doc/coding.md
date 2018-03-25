# NAME

coding - html ファイルのコーディングルール

# SYNOPSIS

# EXAMPLE

- html ファイルの基本形

```html
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta charset="UTF-8">
<title>タイトル</title>
</head>
<body>
</body>
</html>
```

- body の中身

```html
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta charset="UTF-8">
<title>タイトル</title>
</head>
<body>
<div>
  <!-- body ヘッダー -->
  <div>
    <p>ヘッダー</p>
  </div>
  <!-- body コンテンツ -->
  <div>
    <p>コンテンツ</p>
  </div>
  <!-- body フッター -->
  <div>
    <p>フッター</p>
  </div>
</div>
</body>
</html>
```

- 入力フォームのマークアップ

```html
<!-- 例: create.html ログインユーザーを登録する -->
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta charset="UTF-8">
  <title>ログインユーザー登録画面</title>
</head>
<body>
<div>
  <!-- body ヘッダー -->
  <div>
    <h1>ログインユーザー登録画面</h1>
  </div>
  <!-- body コンテンツ -->
  <div>
    <h1>登録情報入力フォーム</h1>
    <div>
      <form method="POST" action="/auth" name="auth_create">
        <div>
          <label for="login_id">ログインID名 (例: 'hackerz@gmail.com')</label>
          <input type="text" name="login_id" id="login_id">
        </div>
        <div>
          <input type="text" name="password" id="password">
          <label for="password">ログインパスワード (例: 'hackerz')</label>
        </div>
        <div>
          <label for="name">名前 (例: 'おそまつ')</label>
          <input type="text" name="name" id="name">
        </div>
        <div>
          <input type="submit" value="登録">
        </div>
      </form>
    </div>
  </div>
  <!-- body フッター -->
  <div>
    <p>Copyright (C) sample Inc. All Rights Reserver.</p>
  </div>
</div>
</body>
</html>
```

- コンテンツを表示するだけ

```html
<!-- 例: show.html ユーザー情報詳細 -->
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta charset="UTF-8">
  <title>ログインユーザー情報詳細</title>
</head>
<body>
<div>
  <!-- body ヘッダー -->
  <div>
    <h1>ログインユーザー情報詳細</h1>
  </div>
  <!-- body コンテンツ -->
  <div>
    <h1>ID: hackerz@gmail.com</h1>
    <div>
      <ul>
        <li> ID: 5</li>
        <li> ログインID名: hackerz@gmail.com</li>
        <li> ログインパスワード: **** </li>
        <li> 名前: おそまつ</li>
        <li> 登録日時: 2016-01-08 12:24:12</li>
        <li> 修正日時: 2016-01-08 12:24:12</li>
      </ul>
    </div>
  </div>
  <!-- body フッター -->
  <div>
    <p>Copyright (C) sample Inc. All Rights Reserver.</p>
  </div>
</div>
</body>
</html>
```

# DESCRIPTION

html ファイルの基本形について

```
html のマークアップをするまえに
最低限の雛形を決めておく
参考記事
http://www.tagindex.com/html5/basic/basic.html

マークアップのルールが特に指定がない場合は下記の様な書き方が無難
html5 と css3 の書き方をする
インデントは半角スペース2個
文字コードは UTF-8 改行コードは LF
ファイルの最後は改行文字で終了する
ファイル名は半角英数文字のみで拡張子は html
例: `show.html` など
```

body タグの中身について

```
利用するタグについて
マークアップするものが特に詳細な指定がない場合
利用するタグをあらかじめ決めておくとよい

body 内のタグ
h1,h2,h3,header,footer
p,pre,ul,li,div
a,span,br
img,table,tr,td,th
form,input,select,textarea

参考記事
http://www.tagindex.com/html5/
```

入力フォームのマークアップについて

```
サーバーへのリクエスト、レスポンスの概念はある程度理解しておいた方がよい
入力フォームを送信するということは、サーバーへリクエストをするということなので
リクエストをする URL と http メソッドを決めなくてはいけない
http メソッドは GET と POST 以外にもあるが、 html タグからおくれるものは
この二つと思っておいてよい。
入力フォームの中に入力フォームを入れ子に設置することはできない。

参考記事
http://www.tagindex.com/html5/form/

新規登録する URL の例
- URL: `/auth`
- HTTP METHOD: POST
```

コンテンツを表示するだけのマークアップについて

```
表示するコンテンツの内容は刻々と修正がおこなわれることを意識しておく。
タグの数は多くなってしまうが一つ一つの部品を取り替えやすくするイメージで
マークアップする方がいいかもしれない
```

# TODO

# SEE ALSO

データベーステーブルの例

```sql
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
```
