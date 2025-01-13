# 外部キー削除できない場合

外部キーの削除は以下で可能

`ALTER TABLE [テーブル名] DROP FOREIGN KEY [外部キー制約の名前];`

ここで言う「外部キー制約の名前」は

テーブル定義で外部キー制約を作成するとき、に指定するもので

名前を指定しない場合はMySQLが自動的に生成する。


外部キー制約の名前を確認するには下記SQLを入力して確認できる

`SHOW CREATE TABLE [テーブル名]`

実行結果

```
CREATE TABLE [テーブル名] (
    ...
    CONSTRAINT `外部キー制約の名前` FOREIGN KEY (`キー名`) REFERENCES `テーブル名` (`キー名`)
)
```

この中のCONSTRAINTで指定された名前が、実際の外部キー制約の名前となる

SHOW CREATE TABLE以外にも、INFORMATION_SCHEMAを利用して確認できるらしい