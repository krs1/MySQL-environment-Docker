-- 学部テーブルはすでにあるので消す
CREATE TABLE 学部 (
  ID    CHAR(1)      PRIMARY KEY,
  名前   VARCHAR(20)  UNIQUE NOT NULL,
  備考   VARCHAR(100) DEFAULT '特になし' NOT NULL
)