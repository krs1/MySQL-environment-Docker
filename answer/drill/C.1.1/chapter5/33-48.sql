-- 33
SELECT 口座番号, 名義, '◯' AS 口座区分 FROM 口座 UNION SELECT 口座番号, 名義, '×' AS 口座区分 FROM 廃止口座 ORDER BY 名義;

-- 34
SELECT 口座番号, 残高 / 1000 AS 全円単位の残高 FROM 口座 WHERE 残高 >= 1000000;

-- 35
INSERT INTO 口座 (口座番号 , 名義 , 種別 , 残高 , 更新日 ) VALUES ('0652281','タカギ　ノブオ','1', 100000 + 3000, '2024-04-01');
INSERT INTO 口座 (口座番号, 名義, 種別, 残高, 更新日) VALUES ('1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2024-04-02');
INSERT INTO 口座(口座番号, 名義, 種別 , 残高 , 更新日 ) VALUES ('2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2024-04-03');

-- 36
UPDATE 口座 SET 残高 = (残高 - 3000) * 1.003 WHERE 口座番号 IN ('0652281', '1026413', '2239710')

-- 37
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日 FROM 口座 WHERE 更新日 < '2024-01-01';

-- 38
SELECT 口座番号,  CONCAT('カ)', 名義) AS 名義 FROM 口座 WHERE 種別 = '3';

-- 39
SELECT DISTINCT 種別 AS 種別コード, CASE 種別 WHEN '1' THEN '普通' WHEN '2' THEN '当座' ELSE '別段' END AS 種別名 FROM 口座;

-- 40
SELECT 口座番号, 名義, CASE WHEN 残高 < 100000 THEN 'C' WHEN 残高 >= 100000 AND 残高 < 1000000 THEN 'B' ELSE 'A' END AS 残高ランク FROM 口座;

-- 41
SELECT CHAR_LENGTH(口座番号) AS 口座番号, CHAR_LENGTH(REPLACE( 名義 , '　', '')) AS 名義, CHAR_LENGTH(残高) AS 残高 FROM 口座;

-- 42
SELECT * FROM 口座 WHERE SUBSTRING( 名義 , 1, 5) LIKE '% カワ %'

-- 43
SELECT * FROM 口座 WHERE CHAR_LENGTH(残高) >= 4 AND SUBSTRING(残高, CHAR_LENGTH(残高)-2, 3) = '000'

-- 44
SELECT 口座番号, 残高, TRUNCATE(残高 * 0.0002, 0) AS 利息 FROM 口座 ORDER BY 残高 DESC

-- 45
SELECT 口座番号, 残高, CASE WHEN 残高 < 500000 THEN TRUNCATE(残高 * 0.0001, 0)
WHEN 残高 >= 500000 AND 残高 < 2000000 THEN TRUNCATE(残高 * 0.0002, 0) WHEN 残高 >= 2000000 THEN TRUNCATE(残高 * 0.0003, 0) END AS 残高別利息 FROM 口座 ORDER BY 残高別利息 DESC, 口座番号

-- 46
INSERT INTO 口座 ( 口座番号 , 名義 , 種別 , 残高 , 更新日 ) VALUES ('0351262', ' イトカワ　ダイ ', '2', 635110, CURRENT_DATE);
INSERT INTO 口座 ( 口座番号 , 名義 , 種別 , 残高 , 更新日 ) VALUES ('1015513', ' アキツ　ジュンジ ', '1', 88463, CURRENT_DATE);
INSERT INTO 口座 ( 口座番号 , 名義 , 種別 , 残高 , 更新日 ) VALUES ('1739298', ' ホシノ　サトミ ', '1', 704610, CURRENT_DATE);

-- 47
SELECT 口座番号, 名義, 種別, 残高, CONCAT(SUBSTRING(更新日, 1, 4) , '年' , SUBSTRING(更新日, 6, 2) , '月' , SUBSTRING(更新日, 9, 2) , '日') AS 更新日
FROM 口座 WHERE 更新日 >= '2024-01-01'

-- 48
SELECT COALESCE(更新日, ' 設定なし ') AS 更新日 FROM 口座