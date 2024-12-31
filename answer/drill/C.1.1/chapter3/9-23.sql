-- 9
SELECT * FROM 口座 WHERE 口座番号 = '0037651'

-- 10
SELECT * FROM 口座 WHERE 残高 > 0;

-- 11
SELECT * FROM 口座 WHERE 口座番号 < '1000000';

-- 12
SELECT * FROM 口座 WHERE 更新日 < '2024-01-01';

-- 13
SELECT * FROM 口座 WHERE 残高 >= 1000000;

-- 14
SELECT * FROM 口座 WHERE 種別 != '1';

-- 15
SELECT * FROM 口座 WHERE 更新日 IS NULL;

-- 16
SELECT * FROM 口座 WHERE 名義 LIKE '%ハシ%';

-- 17
SELECT * FROM 口座 WHERE 更新日 BETWEEN '2024-01-01' AND '2024-01-31';

-- 18
SELECT * FROM 口座 WHERE 種別 IN ('2', '3');

-- 19
SELECT * FROM 口座 WHERE 名義 IN('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ');

-- 20
SELECT * FROM 口座 WHERE 更新日 >= '2023-12-30' AND 更新日 < '2024-01-05';

-- 21
SELECT * FROM 口座 WHERE 残高 < 10000 AND 更新日 IS NOT NULL;

-- 22
SELECT * FROM 口座 WHERE 口座番号 LIKE '2______' OR 名義 LIKE 'エ__　%コ';