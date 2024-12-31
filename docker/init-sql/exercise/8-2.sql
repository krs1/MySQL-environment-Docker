USE exercise;

-- テーブル: 部署
CREATE TABLE IF NOT EXISTS 部署 (
    部署ID INTEGER NOT NULL,
    名前 VARCHAR(40) NOT NULL,
    本拠点ID INTEGER NOT NULL
);

-- テーブル: 支店
CREATE TABLE IF NOT EXISTS 支店 (
    支店ID INTEGER NOT NULL,
    名前 VARCHAR(40) NOT NULL,
    支店長ID CHAR(8) NOT NULL
);

-- テーブル: 社員
CREATE TABLE IF NOT EXISTS 社員 (
    社員番号 CHAR(8) NOT NULL,
    名前 VARCHAR(40) NOT NULL,
    生年月日 DATE NOT NULL,
    部署ID INTEGER NOT NULL,
    上司ID CHAR(8),
    勤務地ID INTEGER NOT NULL
);

-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE 部署;
TRUNCATE TABLE 支店;
TRUNCATE TABLE 社員;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

-- データ挿入: 部署
INSERT INTO 部署 (部署ID, 名前, 本拠点ID) VALUES
(1, '経営企画部', 12),
(2, '法務部', 12),
(3, '経理部', 12),
(4, '総務部', 12),
(5, '開発部', 1);

-- データ挿入: 支店
INSERT INTO 支店 (支店ID, 名前, 支店長ID) VALUES
(12, '東京', '12459040'),
(24, '京都', '31005782');

-- データ挿入: 社員
INSERT INTO 社員 (社員番号, 名前, 生年月日, 部署ID, 上司ID, 勤務地ID) VALUES
('21000021', '菅原拓真', '1993-09-01', 5, '12459040', 12),
('12459040', '宇多田定一', '1979-01-01', 5, NULL, 12),
('61381041', '大江岳人', '1994-09-23', 5, '31005782', 12),
('31005782', '綾小路紘子', '1987-02-05', 5, NULL, 24);