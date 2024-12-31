# TL;DR
MySQL環境構築用のリポジトリ


# MySQLのバージョン
LTSのバージョンを使用する

作成時はMySQL 8.4.3
[MySQL 8.4 Release Notes](https://dev.mysql.com/doc/relnotes/mysql/8.4/en/)

バージョンを変更したい場合はdocker-composeファイルを編集する

# Usage

## 下記コマンドで起動し、ターミナルへ入る

docker-compose up -d

docker exec -it mysql_db bash

## 下記コマンドでMySQLにログイン
mysql -h localhost  -P 3306 -u root -p

## 直接入る場合
docker exec -it mysql_db mysql -uroot -proot


## データリセット
docker-compose down

rm -rf ./docker/db/data/

## テーブル作り直し用コマンド

docker exec -i mysql_db mysql -uroot -proot < ./docker/init-sql/init.sql

import.shでのリセットも可能

# docker restart

docker restart

docker restart mysql_db

## デバッグ用

SHOW VARIABLES LIKE 'character_set%';

SHOW VARIABLES LIKE 'collation%';