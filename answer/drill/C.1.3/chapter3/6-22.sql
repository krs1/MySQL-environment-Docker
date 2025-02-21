-- 6
SELECT * FROM パーティー WHERE ID = 'C02'

-- 7
UPDATE パーティー SET HP = 120 WHERE ID = 'A01'

-- 8
SELECT ID, 名称 , HP FROM パーティー WHERE HP < 100

-- 9
SELECT ID, 名称 , MP FROM パーティー WHERE MP >= 100

-- 10
SELECT イベント番号 , イベント名称 , タイプ FROM イベント WHERE タイプ != 3

-- 11
SELECT イベント番号 , イベント名称 FROM イベント WHERE イベント番号 <= 5

-- 12
SELECT イベント番号 , イベント名称 FROM イベント WHERE イベント番号 > 20

-- 13
SELECT イベント番号 , イベント名称 FROM イベント WHERE 前提イベント番号 IS NULL

-- 14
SELECT イベント番号 , イベント名称 , 後続イベント番号 FROM イベント
WHERE 後続イベント番号 IS NOT NULL

-- 15
UPDATE パーティー SET 状態コード = '01' WHERE 名称 LIKE '%ミ%'

-- 16
SELECT ID, 名称 , HP FROM パーティー WHERE HP BETWEEN 120 AND 160

-- 17
SELECT 名称 , 職業コード FROM パーティー WHERE 職業コード IN ('01', '10','11')

-- 18
SELECT 名称 , 状態コード FROM パーティー WHERE 状態コード NOT IN ('00','09')

-- 19
SELECT * FROM パーティー WHERE HP > 100 AND MP > 100

-- 20
SELECT * FROM パーティー WHERE ID LIKE 'A%' AND 職業コード LIKE '2%'

-- 21
SELECT * FROM イベント
WHERE タイプ = '1' AND 前提イベント番号 IS NOT NULL
AND 後続イベント番号 IS NOT NULL

-- 22
-- パーティーテーブルの主キーは ID、イベントテーブルの主キーはイベント番号