-- 34
SELECT 商品コード , 単価 , 単価 * 0.95 AS キャンペーン価格 FROM 商品 WHERE
商品区分 = '9' ORDER BY 商品コード

-- 35
UPDATE 注文 SET クーポン割引料 = クーポン割引料 + 300
WHERE 注文日 >= '2024-03-12' AND 注文日 < '2024-03-15' AND 数量 >= 2 AND クーポン割引料 IS NOT NULL

-- 36
UPDATE 注文 SET 数量 = 数量 - 1
WHERE 注文番号 = '202402250126' AND 商品コード = 'W0156'

-- 37
SELECT CONCAT(注文番号 , '-' ,注文枝番) FROM 注文
WHERE 注文番号 >= '202310010001' AND 注文番号 <= '202310319999'

-- 38
SELECT DISTINCT 商品区分 AS 区分,
CASE 商品区分
WHEN '1' THEN '衣類'
WHEN '2' THEN '靴'
WHEN '3' THEN '雑貨'
WHEN '9' THEN '未分類 ' END AS 区分名
FROM 商品

-- 39
SELECT 商品コード , 商品名 , 単価 ,
CASE
WHEN 単価 < 3000 THEN 'S'
WHEN 単価 >= 3000 AND 単価 < 10000 THEN 'M'
ELSE 'L' END AS 販売価格ランク,
CONCAT(商品区分, ':',
    CASE 商品区分
    WHEN '1' THEN '衣類'
    WHEN '2' THEN '靴'
    WHEN '3' THEN '雑貨'
    WHEN '9' THEN '未分類'
    END) AS 商品区分
FROM 商品 ORDER BY 単価 , 商品コード

-- 40
SELECT 商品名 , CHAR_LENGTH( 商品名 ) AS 文字数
FROM 商品
WHERE CHAR_LENGTH( 商品名 ) > 10
ORDER BY 文字数

-- 41
SELECT 注文日 , SUBSTRING(注文番号 , 9, 4) AS 注文番号 FROM 注文

-- 42
UPDATE 商品 SET 商品コード = CONCAT('E', SUBSTRING(商品コード, 2, 4))
WHERE SUBSTRING(商品コード, 1, 1) = 'M'

-- 43
SELECT SUBSTRING( 注文番号, 9, 4) AS 注文番号
FROM 注文
WHERE SUBSTRING( 注文番号, 9, 4) >= '1000' 
AND SUBSTRING( 注文番号 , 9, 4) <= '2000'
ORDER BY SUBSTRING( 注文番号 , 9, 4)

-- 44
UPDATE 廃番商品 SET 廃番日 = CURRENT_DATE WHERE 商品コード = 'S1990'

-- 45
SELECT 商品コード , 商品名 , 単価 , TRUNCATE( 単価 * 0.7, 0) AS 値下げした単価
FROM 商品 WHERE 単価 >= 10000