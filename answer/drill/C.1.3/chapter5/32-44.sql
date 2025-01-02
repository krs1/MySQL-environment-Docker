--32

SELECT
CASE
WHEN 職業コード LIKE '1%' THEN 'S'
WHEN 職業コード LIKE '2%' THEN 'M'
ELSE 'A' END AS 職業区分,
職業コード , ID, 名称
FROM パーティー
ORDER BY 職業コード

--33
SELECT 名称 AS なまえ, HP AS 現在のHP,
HP + 50 AS 装備後のHP
FROM パーティー
WHERE 職業コード IN ('11', '21')

--34
UPDATE パーティー SET MP = MP + 20 WHERE ID IN ('A01', 'A03')

--35
SELECT 名称 AS なまえ,
HP AS '現在の HP',
HP * 2 AS 予想されるダメージ
FROM パーティー
WHERE 職業コード = '11'

--36
SELECT 名称 AS なまえ,
CONCAT(HP , '/' , MP) AS HPとMP,
CASE 状態コード
    WHEN '00' THEN NULL
    WHEN '01' THEN '眠り'
    WHEN '02' THEN '毒'
    WHEN '03' THEN '沈黙'
    WHEN '04' THEN '混乱'
    WHEN '09' THEN '気絶'
END AS ステータス
FROM パーティー

--37
SELECT イベント番号 , イベント名称 ,
CASE タイプ
WHEN '1' THEN '強制'
WHEN '2' THEN 'フリー'
WHEN '3' THEN '特殊'
END AS タイプ ,
CASE 
    WHEN イベント番号 >= 1 AND イベント番号 <=10 THEN '序盤'
    WHEN イベント番号 >= 11 AND イベント番号 <=17 THEN '中盤'
    ELSE '終盤'
END AS 発生時期
FROM イベント

-- 38
SELECT 名称 AS なまえ ,
HP AS '現在の HP',
CHAR_LENGTH(名称) * 10 AS 予想ダメージ
FROM パーティー

-- 39

/* %演算子を使った場合 */
UPDATE パーティー SET 状態コード = '04' WHERE HP % 4 = 0 OR MP % 4 = 0

/* MOD関数を使った場合 */
UPDATE パーティー SET 状態コード = '04' WHERE MOD(HP, 4) = 0 OR MOD(MP, 4) = 0

-- 40
SELECT TRUNCATE(777 * 0.7, 0) AS 支払った金額

-- 41
UPDATE パーティー SET HP = ROUND(HP * 1.3, 0), MP = ROUND(MP * 1.3, 0)

-- 42
SELECT 名称 AS なまえ,
HP,
POWER(HP, 0) AS 攻撃1回目,
POWER(HP, 1) AS 攻撃2回目,
POWER(HP, 2) AS 攻撃3回目
FROM パーティー
WHERE 職業コード = '10'

-- 43
SELECT 名称 AS なまえ,
HP,
状態コード,
CASE
    WHEN HP <= 50 THEN 3 + 状態コード
    WHEN HP >= 51 AND HP <= 100 THEN 2 + 状態コード
    WHEN HP >= 101 AND HP <= 150 THEN 1 + 状態コード
    ELSE CAST(状態コード as signed) -- 状態コード + 0 でもキャストできる
END AS リスク値
FROM パーティー
ORDER BY リスク値 DESC, HP

-- 44
SELECT COALESCE(前提イベント番号, ' 前提なし ') AS 前提イベント番号,
イベント番号,
COALESCE(後続イベント番号, ' 後続なし ') AS 後続イベント番号
FROM イベント
ORDER BY イベント番号

