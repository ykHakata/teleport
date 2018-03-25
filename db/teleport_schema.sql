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
DROP TABLE IF EXISTS teleport;
CREATE TABLE teleport (                                 -- 位置情報付きのチェックイン記録
    id              INTEGER PRIMARY KEY AUTOINCREMENT,  -- ID (例: 5)
    user_id         TEXT,                               -- ユーザーID名 (例: 2)
    gps             TEXT,                               -- 位置情報 (例: '33.6065756,130.418297')
    status          TEXT,                               -- チェックインステータス (例: 10: チェックイン, 20: チェックアウト)
    stamp_ts        TEXT,                               -- 打刻日時 (例: '2016-01-08 12:24:12')
    deleted         INTEGER,                            -- 削除フラグ (例: 0: 削除していない, 1: 削除済み)
    created_ts      TEXT,                               -- 登録日時 (例: '2016-01-08 12:24:12')
    modified_ts     TEXT                                -- 修正日時 (例: '2016-01-08 12:24:12')
);
