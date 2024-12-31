USE exercise;

-- テーブル: 家計簿
CREATE TABLE IF NOT EXISTS 家計簿 (
    日付 DATE NOT NULL,
    費目 VARCHAR(20) NOT NULL,
    メモ VARCHAR(100),
    入金額 INTEGER,
    出金額 INTEGER
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 家計簿;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 家計簿
INSERT INTO 家計簿 (日付, 費目, メモ, 入金額, 出金額) VALUES
('2024-02-03', '食費', 'コーヒーを購入', 0, 380),
('2024-02-10', '給料', '1月の給料', 280000, 0),
('2024-02-11', '教養娯楽費', '書籍を購入', 0, 2800),
('2024-02-14', '交際費', '同期会の会費', 0, 5000),
('2024-02-18', '水道光熱費', '1月の電気代', 0, 7560);
