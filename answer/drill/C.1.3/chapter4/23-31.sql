-- 23
SELECT DISTINCT 状態コード FROM パーティー

-- 24
SELECT ID, 名称 FROM パーティー ORDER BY ID

-- 25
SELECT 名称 , 職業コード FROM パーティー ORDER BY 名称 DESC

-- 26
SELECT 名称 , HP, 状態コード FROM パーティー ORDER BY 状態コード , HP DESC

-- 27
SELECT タイプ , イベント番号 , イベント名称 , 前提イベント番号 , 後続イベント番号 FROM イベント ORDER BY 1, 2

-- 28
SELECT * FROM パーティー ORDER BY HP DESC LIMIT 3

-- 29
SELECT * FROM パーティー ORDER BY MP DESC LIMIT 2,1

-- 30
SELECT イベント番号 FROM イベント
EXCEPT
SELECT イベント番号 FROM 経験イベント ORDER BY 1

-- 31
SELECT イベント番号 FROM 経験イベント WHERE クリア区分 ='1' INTERSECT
SELECT イベント番号 FROM イベント WHERE タイプ ='2'