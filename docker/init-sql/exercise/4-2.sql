USE exercise;

-- テーブル: 自然数
CREATE TABLE IF NOT EXISTS 自然数 (
    値 INTEGER
);

-- テーブル: 整数
CREATE TABLE IF NOT EXISTS 整数 (
    値 INTEGER
);

-- テーブル: 奇数
CREATE TABLE IF NOT EXISTS 奇数 (
    値 INTEGER
);

-- テーブル: 偶数
CREATE TABLE IF NOT EXISTS 偶数 (
    値 INTEGER
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 自然数;
TRUNCATE TABLE 整数;
TRUNCATE TABLE 奇数;
TRUNCATE TABLE 偶数;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 自然数
INSERT INTO 自然数 (値) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- データ挿入: 整数
INSERT INTO 整数 (値) VALUES
(-10),
(-9),
(-8),
(-7),
(-6),
(-5),
(-4),
(-3),
(-2),
(-1),
(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- データ挿入: 奇数
INSERT INTO 奇数 (値) VALUES
(-9),
(-7),
(-5),
(-3),
(-1),
(1),
(3),
(5),
(7),
(9);

-- データ挿入: 偶数
INSERT INTO 偶数 (値) VALUES
(-10),
(-8),
(-6),
(-4),
(-2),
(0),
(2),
(4),
(6),
(8),
(10);
