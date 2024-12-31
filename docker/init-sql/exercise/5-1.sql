USE exercise;

-- テーブル: 試験結果
CREATE TABLE IF NOT EXISTS 試験結果 (
    受験者ID VARCHAR(6) NOT NULL,
    午前 INTEGER,
    午後1 INTEGER,
    午後2 INTEGER,
    論述 INTEGER,
    平均点 INTEGER
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 試験結果;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 試験結果
INSERT INTO 試験結果 (受験者ID, 午前, 午後1, 午後2, 論述, 平均点) VALUES
('SW1046', 86, NULL, 68, 91, 80),
('SW1350', 65, 53, 70, NULL, 68),
('SW1877', NULL, 59, 56, 36, 56);
