# -*- coding: utf-8 -*-
x = STDIN.gets.to_i # 標準入力を受け取り、整数に変換する。
y = if x % 2 == 0 then  # ifの結果をyに代入
    x * 2   # 式(右辺)のみを記述
else
    x * 3
end
puts y
