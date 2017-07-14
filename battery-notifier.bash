#!/bin/bash

# ioreg：内蔵バッテリーの状況などシステム情報を表示
# grep CurrentCapacity：CurrentCapacityのある行を抽出することで、現在のバッテリー量を抽出
# sed -e "s/[^0-9]//g"：数字のみを抽出
cur_capacity=`ioreg -l | grep CurrentCapacity | sed -e "s/[^0-9]//g"`
max_capacity=`ioreg -l | grep MaxCapacity | sed -e "s/[^0-9]//g"`
echo "現在のバッテリー量："$cur_capacity
echo "最大のバッテリー量："$max_capacity

# 小数点以下2桁まで割り算
percent=`echo "100 * $cur_capacity / $max_capacity" | bc`
# scaleを使えば小数点を扱える
echo "バッテリーの割合："$percent"%"

if [[ $percent -gt 73 ]]; then
    terminal-notifier -title $percent"%" -message "充電をやめましょう"
elif [[ $percent -lt 50 ]]; then
    terminal-notifier -title $percent"%" -message "充電を再開しましょう"
fi

