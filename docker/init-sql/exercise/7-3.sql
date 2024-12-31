USE exercise;

-- テーブル: 個体識別
CREATE TABLE IF NOT EXISTS 個体識別 (
    個体識別番号 CHAR(4) NOT NULL,
    出生日 DATE,
    雌雄コード CHAR(1),
    母牛番号 CHAR(4),
    品種コード CHAR(2),
    飼育県 VARCHAR(10)
);

-- テーブル: 頭数集計
CREATE TABLE IF NOT EXISTS 頭数集計 (
    飼育県 VARCHAR(10),
    頭数 INTEGER
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 個体識別;
TRUNCATE TABLE 頭数集計;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 個体識別
INSERT INTO 個体識別 (個体識別番号, 出生日, 雌雄コード, 母牛番号, 品種コード, 飼育県) VALUES
('1211', '2015-04-01', '2', '1814', '01', '千葉県'),
('4530', '2016-05-15', '2', '2072', '02', '群馬県'),
('2237', '2017-06-30', '1', '3056', '03', '千葉県'),
('8105', '2017-11-29', '1', '1211', '02', '北海道'),
('1097', '2018-01-04', '2', '1211', '01', '北海道'),
('6417', '2018-01-15', '2', '4530', '01', '岩手県'),
('5014', '2018-01-16', '1', '7710', '02', '北海道'),
('5513', '2018-01-17', '2', '7104', '01', '北海道'),
('1164', '2018-01-18', '1', '7340', '02', '千葉県'),
('2150', '2020-10-23', '1', '3335', '01', '岩手県');