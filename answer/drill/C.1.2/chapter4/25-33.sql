-- 25
SELECT 商品コード, 商品名 FROM 商品 WHERE 商品区分 = '1' ORDER BY 商品コード DESC

-- 26
SELECT 注文日 , 注文番号 , 注文枝番 , 商品コード , 数量 FROM 注文 WHERE 注文日 >= '2024-03-01'
ORDER BY 注文日 , 注文番号 , 注文枝番

-- 27
SELECT DISTINCT 商品コード FROM 注文 ORDER BY 商品コード

-- 28
SELECT 注文日 FROM 注文 ORDER BY 注文日 DESC LIMIT 10

-- 29
SELECT * FROM 商品 ORDER BY 単価 , 商品区分 , 商品コード
LIMIT 5, 15

-- 30
SELECT * FROM 廃番商品 WHERE 廃番日 >= '2022-12-01' AND 廃番日 < '2023-01-01' 
UNION
SELECT * FROM 廃番商品 WHERE 売上個数 > 100
ORDER BY 6 DESC

-- 31
SELECT 商品コード FROM 商品 EXCEPT SELECT 商品コード FROM 注文 ORDER BY 1

-- 32
SELECT 商品コード FROM 商品 INTERSECT SELECT 商品コード FROM 注文 ORDER BY
1 DESC

-- 33
SELECT 商品コード, 商品名, 単価 FROM 商品
WHERE 商品区分 = '9' AND 単価 <= 1000
UNION
SELECT 商品コード , 商品名 , 単価 FROM 商品
WHERE 商品区分 = '9' AND 単価 > 10000
ORDER BY 3, 1