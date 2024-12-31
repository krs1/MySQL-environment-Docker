#!/bin/bash

# ファイル選択用の関数
select_file_from_dir() {
  local dir=$1
  echo "ディレクトリ $dir を参照します。"
  
  # ディレクトリの存在確認
  if [ -d "$dir" ]; then
    echo "$dir ディレクトリ内のファイル:"
    # ディレクトリ内のファイルをリスト化
    files=($(ls "$dir"))
    if [ ${#files[@]} -eq 0 ]; then
      echo "ファイルがありません。スクリプトを終了します。"
      exit 1
    fi

    # ファイルを番号付きでリスト表示
    for i in "${!files[@]}"; do
      echo "$((i + 1))) ${files[$i]}"
    done

    # ファイル選択
    read -p "ファイルを選択してください (番号を入力): " file_choice
    if [[ $file_choice -ge 1 && $file_choice -le ${#files[@]} ]]; then
      selected_file="${files[$((file_choice - 1))]}"
      echo "選択されたファイル: $selected_file"
      echo $dir
      docker exec -i mysql_db mysql -uroot -proot < "$dir/$selected_file"
    else
      echo "無効な選択肢です。スクリプトを終了します。"
      exit 1
    fi
  else
    echo "$dir ディレクトリが存在しません。"
    exit 1
  fi
}

# メインメニュー
echo "以下の候補から選択してください:"
echo "1) init"
echo "2) drill"
echo "3) exercise"

# ユーザー入力を取得
read -p "選択肢を入力してください (1-3): " choice

case $choice in
  1)
    echo "init を選択しました。"
    docker exec -i mysql_db mysql -uroot -proot < ./docker/init-sql/init.sql
    ;;
  2)
    echo "drill を選択しました。"
    select_file_from_dir "./docker/init-sql/drill"
    ;;
  3)
    echo "exercise を選択しました。"
    select_file_from_dir "./docker/init-sql/exercise"
    ;;
  *)
    echo "無効な選択肢です。スクリプトを終了します。"
    exit 1
    ;;
esac

exit 0
