USE exercise;

-- テーブル: 成績表
CREATE TABLE IF NOT EXISTS 成績表 (
    学籍番号 CHAR(4) PRIMARY KEY,
    学生名 VARCHAR(20),
    法学 INTEGER,
    経済学 INTEGER,
    哲学 INTEGER,
    情報理論 INTEGER,
    外国語 INTEGER,
    総合成績 CHAR(1)
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 成績表;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 成績表
INSERT INTO 成績表 (学籍番号, 学生名, 法学, 経済学, 哲学, 情報理論, 外国語, 総合成績) VALUES
('S002', '織田　信忠', 49, 45, 43, 42, 40, NULL),
('A003', '豊臣　秀頼', 45, 55, 95, 75, 85, NULL),
('E004', '徳川　秀忠', 90, 40, 50, 60, 30, NULL);
