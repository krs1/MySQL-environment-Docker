# TL;DR
MySQL環境構築用のリポジトリ


# MySQLのバージョン
LTSのバージョンを使用する

作成時はMySQL 8.4.3
[MySQL 8.4 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.4/en/)

バージョンを変更したい場合はdocker-composeファイルを編集する

# Usage
下記コマンドで起動し、ターミナルへ入る

docker-compose up -d
docker exec -it mysql_db bash
mysql -h localhost -u root -P 3306