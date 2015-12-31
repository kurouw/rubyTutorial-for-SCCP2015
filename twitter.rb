# -*- coding: utf-8 -*-
#twitter作成
#流れと大まかな仕様
#1.プログラム起動
#2.ログイン画面
#3.ユーザー名でログイン
#4.モード選択
#->1.ホーム(タイムライン)
#->2.ツイート
#->3.アカウント->logoutなどができる。
#5.タイムラインには世界中の人のつぶやきが見える
#6.つぶやきのみができる。
#7.つぶやくとそのユーザー名のツイート配列に入る。
#8.ツイートには以下の値を持っている。
#→つぶやいた時間、つぶやきの内容をもっている。

#=========================================
class Func

  @@function_cnf=0
  
  def initialize
    @scnf = 0
    @tweet = 0
    f_rogin
    
    if @scnf !="-1" then
      f_mode
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

  def f_mode
    @m_cnf=0
    loop do
      puts "モード選択"
      puts "ホーム -> 1"
      puts "ツイート -> 2"
      puts "アカウント -> 3"
      print "->"
      mode=STDIN.gets.chomp!
      if mode== '1' then
        timeline
      elsif mode== '2' then
        f_tweet
      elsif mode== '3' then
        @m_cnf=f_account
      end
      
      break if @m_cnf==-1
    end
  end
      
  def timeline
    User.timeline
  end

  def f_account
    puts "作成中"
    return -1
  end

  def f_tweet
    if @scnf == "1" then
      puts "いまどうしてる？"
      User.insert
      @@function_cnf=1
    elsif @scnf == "-1" then
      @@function_cnf=-1
    end
  end

  def to_s
    "#{@@function_cnf}"
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

  def self.insert
    @@tweet << Tweet.new
    name=Sign.find.to_s
    @@user[name]=@@tweet
    return @@user[name]
  end

  def self.timeline
    @@user.each do |name,tw|
      tw.each do |a|
        print "@",name,"  "
        puts a
      end
    end
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
    elsif @@exist[@username]==0 then
      sign
    elsif @@exist[@username]==1 then
      @@exist[@username]=2
    end
    
  end
  
  def sign
    puts "ユーザーがいません。"
    puts "ユーザー登録しますか？(y/n)"
    print "->"
    a = STDIN.gets.chomp!
    if a == "y" then
      @@exist[@username]=1
    elsif a == "n" then
      @@exist[@username]=0
    end
  end

  def self.find
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
    @tweet = 0
    tweet_do
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
        puts " ------------"
        puts "|ログイン成功|"
        puts " ------------"
        @cnf=1
        break
      end
      
      puts "終了しますか?(y/n)"
      cnf=STDIN.gets.chomp!
      if cnf=="y" then
        @cnf=-1
        break
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
puts function_cnf
