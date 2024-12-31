USE exercise;

-- テーブル: 学部
CREATE TABLE IF NOT EXISTS 学部 (
    ID CHAR(2) PRIMARY KEY,
    名前 VARCHAR(20) NOT NULL,
    備考 VARCHAR(100)
);

-- テーブル: 学生
CREATE TABLE IF NOT EXISTS 学生 (
    学籍番号 CHAR(8) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    生年月日 DATE,
    血液型 CHAR(2),
    学部ID CHAR(1),
    FOREIGN KEY (学部ID) REFERENCES 学部(ID)
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 学部;
TRUNCATE TABLE 学生;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 学部
INSERT INTO 学部 (ID, 名前, 備考) VALUES
('R', '理学部', 'りがく'),
('K', '工学部', 'こうがく');

-- データ挿入: 学生
INSERT INTO 学生 (学籍番号, name, 生年月日, 血液型, 学部ID) VALUES
('20241234', '会田　愛', '2005-07-01', 'A', 'R'),
('20245678', '正田　翔太', '2006-09-30', 'O', 'K');