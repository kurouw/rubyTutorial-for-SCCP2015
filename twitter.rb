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

#=========================================
class Func

  @@function_cnf=0
  
  def initialize
    @scnf = f_rogin
    
    if @scnf == "1" then
      @tweet = tweet
    elsif @scnf == "-1" then
      @@function_cnf="-1"
    end
  end

  def f_rogin
    loop do
      @scnf=Rogin.new.to_s
      if @scnf=="-1" then
        break
      elsif @scnf=="1" then
        break
      end
    end
  end

  def timeline
  end

  def tweet
    User.insert(Tweet.new)
  end

end
#=========================================


#---------------------------------
class User
  @@user = {}
  @@tweet = Array.new

  def initialize(username)
    @username = Name.new(username)
    @cnf =  Sign.new(username)
  end

  def insert(tweet)
    @@tweet << Tweet.new(tweet)
    name=Sign.find.to_s
    @@user[name]=@@tweet
    return @@user[name]
  end
  
  def to_s
  "#{@cnf}"
  end
end

#---------------------------------
class Name #ユーザー名を表示クラス
  def initialize(username)
    @username = username
  end

  def to_s
    "#{@username}"
  end
end
#--------------------------
class Sign #サインインクラス
  @@exist = {}
  def initialize(username)
    @username = username
    
    if @@exist[@username].nil? then
      sign
    else
      @@exist[@username]=2
    end
  end
  
  def sign
    puts "ユーザーがいません。"
    puts "ユーザー登録しますか？(y/n)"
    a = STDIN.gets.chomp!
    if a == "y" then
      @@exist[@username]=1
    elsif a == "n" then
      @@exist[@username]=0
    end
  end

  def find
    @@exist.each do |name,exi|
      if exi==2 then
        return name
      end
    end
  end
        
    
  
  def to_s
    "#{@@exist[@username]}"
  end
end

#--------------------------
class Tweet
  def initialize
    @tweet = tweet_do
  end

  def tweet_do
    @tweet = STDIN.gets
  end

  def to_s
    "#{@tweet}"
  end
end
#--------------------------
class Rogin #ログイン
  def initialize
    @cnf=0
    r_rogin
  end

  def r_rogin
    loop do 
      print "ユーザー名を入力してください->"
      arr = STDIN.gets.chomp!
      cnf=User.new(arr)
      cnf=cnf.to_s
      if cnf == "2" then
        puts "ログイン成功"
        @cnf=1
        break
      end
      puts "終了しますか?(y/n)"
      cnf=STDIN.gets
      if cnf=="y" then
        @cnf=-1
      else
        @cnf=0
      end
    end
  end

  def to_s
    "#{@cnf}"
  end
end

#--------------------------

function_cnf=Func.new
