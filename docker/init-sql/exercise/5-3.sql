USE exercise;

-- テーブル: 受注
CREATE TABLE IF NOT EXISTS 受注 (
    受注日 DATE NOT NULL,
    受注ID VARCHAR(10) NOT NULL,
    文字 VARCHAR(100),
    文字数 INTEGER,
    書体コード VARCHAR(10)
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 受注;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 受注
INSERT INTO 受注 (受注日, 受注ID, 文字, 文字数, 書体コード) VALUES
('2023-12-05', '101', 'Satou', NULL, 2),
('2023-12-05', '102', '鈴木 一郎', NULL, 3),
('2023-12-05', '113', '横浜 BASEBALL CLUB', NULL, 1),
('2023-12-08', '140', 'N.R.', NULL, NULL);