# -*- coding: utf-8 -*-
#twitter作成
#流れと大まかな仕様
#1.プログラム起動
#2.ログイン画面
#3.ユーザー名でログイン
#4.タイムラインには世界中の人のつぶやきが見える
#5.つぶやきのみができる。
#6.つぶやくとそのユーザー名のツイート配列に入る。
#7.ツイートには以下の値を持っている。
#→つぶやいた時間、つぶやきの内容をもっている。

class Users
  @@user = {}

  def initialize(username,tweet=1)
    @username = Name.new(username)
    @tweet = tweet
    @cnf = signIN

    if @cnf == "yes" then
      @@user[@username]=@tweet
    end
    
  end

  def self.users
    if @@user[@username].nil? then
      0
    else
      1
    end
  end

  def to_s
    return @cnf
  end
end


class Name
  def initialize(username)
    @username = username
  end

  def to_s
    "#{@username}"
  end
end

def signIN
  if  Users.users == 0 then
    puts "ユーザーがいません。"
    puts "ユーザー登録しますか？"
    puts "登録->y 登録しない->n"
    a = STDIN.gets
    a.chomp!
    if a == "y" then
      signUP(a)
    elsif a == "n" then
      signUP(a)
    end
  else
    "yes"
  end
end

def signUP(cnf)
  if cnf=='y' then
    "yes"
  elsif cnf=='n' then
    "no"
  end
end
  

loop do #ログイン
print "ユーザー名を入力してください->"
arr = STDIN.gets.chomp!
cnf=Users.new(arr)
cnf=cnf.to_s
if cnf == "yes" then
  puts "ログイン成功"
  break
end

end
