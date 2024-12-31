USE exercise;

-- テーブル: 回答者
CREATE TABLE IF NOT EXISTS 回答者 (
    メールアドレス CHAR(30) NOT NULL,
    国名 CHAR(20),
    住居 CHAR(100),
    年齢 INTEGER
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 回答者;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 回答者
INSERT INTO 回答者 (メールアドレス, 国名, 住居, 年齢) VALUES
('suzuki.takashi@example.jp', NULL, 'D', 51),
('philip@example.uk', NULL, 'C', 26),
('hao@example.cn', NULL, 'C', 35),
('marie@example.fr', NULL, 'D', 43),
('hoa@example.vn', NULL, 'D', 22);