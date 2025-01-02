-- 53
SELECT 名称 AS なまえ,
HP AS 現在のHP,
ROUND(HP / (SELECT SUM(HP) FROM パーティー ) * 100, 1) AS パーティーでの割合
FROM パーティー
WHERE 職業コード = '01'

-- 54
-- MySQLの制約でサブクエリに「パーティー」テーブルを指定できない

UPDATE パーティー
SET MP = MP + (
    SELECT UPDATE_MP.MP
    FROM (
        SELECT ROUND(SUM(MP * 0.1)) AS MP
        FROM パーティー
        WHERE 職業コード != '20'
    ) AS UPDATE_MP
)
WHERE 職業コード = '20'

-- 55
SELECT イベント番号 , クリア結果
FROM 経験イベント
WHERE クリア区分 = '1'
AND イベント番号 IN (
    SELECT イベント番号
    FROM イベント
    WHERE タイプ IN('1', '3')
)

-- 56
SELECT 名称, MP FROM パーティー WHERE MP = (SELECT MAX(MP) FROM パーティー)

-- 57
SELECT イベント番号 , イベント名称
FROM イベント
WHERE イベント番号
NOT IN(SELECT イベント番号 FROM 経験イベント )
ORDER BY イベント番号

-- 58
SELECT COUNT(*) AS 未着手イベントの数 
FROM (
    SELECT イベント番号
    FROM イベント
    EXCEPT
    SELECT イベント番号
    FROM 経験イベント
) AS SUB

-- 59
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 < (SELECT イベント番号 FROM 経験イベント WHERE ルート番号 = 5)

-- 60
SELECT イベント番号 , イベント名称 , 前提イベント番号
FROM イベント
WHERE 前提イベント番号 = ANY(
    SELECT イベント番号
    FROM 経験イベント
    WHERE クリア区分 = '1'
)

-- 61
/* イベント番号9の更新 */
UPDATE 経験イベント
SET
クリア区分 = '1',
クリア結果 = 'B',
ルート番号 = (
    SELECT UPDATE_ルート.ルート番号
    FROM (SELECT MAX( ルート番号 ) + 1 AS ルート番号 FROM 経験イベント)  AS UPDATE_ルート
)
WHERE イベント番号 = 9

/* 後続イベントの登録 */ 
INSERT INTO 経験イベント
VALUES ((
    SELECT イベント番号
    FROM イベント
    WHERE 前提イベント番号 = 9
), '0', NULL, NULL)
