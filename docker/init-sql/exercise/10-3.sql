USE exercise;

-- テーブル: 学部
CREATE TABLE IF NOT EXISTS 学部 (
  ID CHAR(1) PRIMARY KEY,
  名前 VARCHAR(20) UNIQUE NOT NULL,
  備考 VARCHAR(100) DEFAULT '特になし' NOT NULL
);



-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 学部;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化