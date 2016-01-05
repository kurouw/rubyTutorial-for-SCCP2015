# -*- coding: utf-8 -*-
#=========================================
class Func #中心クラス

  @@function_cnf=0
  
  def initialize
    @scnf = 0
    @tweet = 0
    core
    
    if @scnf !="-1" then
      f_mode
    end
  end

  def core # continue or end -> アプリを終了するか続けるか。
    puts "ようこそ！"
    puts "続行->s"
    puts "終了->e"
    print "-> "
    x=STDIN.gets.chomp!
    if x=="s" then
      f_login
    else
      @@function_cnf="-1"
      @scnf="-1"
    end
  end
    
  
  def f_login #ログイン機能 Loginクラスにアクセス
    loop do
      @scnf=Login.new.to_s
      if @scnf=="-1" then
        break
      elsif @scnf=="1" then
        break
      end
    end
  end

  def f_mode #モード機能
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
      
      if @m_cnf==-1 then
        @@function_cnf=1
        break
      end
    end
  end
      
  def timeline #タイムライン機能 Userクラスのtimelineにアクセス
    User.timeline
  end

  def f_account #アカウント機能 ログイン中のユーザーのツイート表示、ログアウトができる。
    puts "自分のツイート -> 1"
    puts "ログアウト -> 2"
    print "-> "
    a=STDIN.gets.chomp!
    if a=="1" then
      User.my_tweet
    elsif a=="2" then
      return Sign.logout
    end
  end

  def f_tweet #ツイート機能 Userクラスのinsertにアクセス
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
class User #ユーザー処理
  @@user = {}
  @@time = Array.new
  @@count = 0
  @@tweet = {}

  def initialize(username)
    @username = Name.new(username)
    @cnf =  Sign.new(username)
  end

  def self.insert #ツイート挿入
    name=Sign.find.to_s
    if @@tweet[name].nil? then
      @@tweet[name]=Array.new
    end
    @@tweet[name] << Tweet.new
    @@time.unshift(Time.new)
    @@user[name]=@@tweet[name]
    return @@user[name]
  end

  def self.my_tweet #ログイン中のユーザーのツイート表示
    my_name=Sign.find.to_s
    i=0
    @@user[my_name].reverse_each do |a|
      print "@",my_name,"  "
      print a
      puts @x[i]," "
      i+=1
    end
  end

  def self.timeline #タイムライン機能 時間も一緒に表示
    i=0
    @x=Array.new
    tnow=Time.now
    @@user.reverse_each do |name,tw|
      tw.reverse_each do |a|
        print "@",name,"  "
        print a
        tb=tnow-@@time[i]
        th=(tb/3600).to_i
        tm=(tb/60).to_i
        ts=tb.to_i
        @x[i] = if th>=1 then
          "\t\t#{th}時間前\n"
        elsif 0 < tm && tm <=59 then
          "\t\t#{tm}分前\n"
        elsif 0 < ts && ts <=59 then
          "\t\t#{ts}秒前\n"
        elsif ts==0 then
          "\t\tちょっと前\n"
            end
        puts @x[i]," "
        i+=1
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
class Sign #ユーザー存在確認クラス
  @@exist = {}　#ユーザー名が存在すれば1 ログインすると2になる。
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

  def self.logout #ログアウト ログイン中のユーザーの存在を1にする。
    puts "ログアウトしますか?(y/n)"
    print "-> "
    x=STDIN.gets.chomp!
    if x=="y" then
      name=Sign.find
      @@exist[name]=1
      return -1
    else
      return 1
    end
  end
  
  def sign #サインアップする
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

  def self.find #ログイン中のユーザーを探す、ユーザー名を返す。
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

  def tweet_do #実際にツイートを入力
    @tweet = STDIN.gets
  end

  def to_s
    "#{@tweet}"
  end
end
#--------------------------
class Login #ログイン
  def initialize
    @cnf=0
    l_login
  end

  def l_login #ログイン機能
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
      if cnf=="n" then
        @cnf=0
        break
      else
        @cnf=-1
      end
    end
  end

  def to_s
    "#{@cnf}"
  end
end

#--------------------------
loop do
  function_cnf=Func.new
  break if function_cnf.to_s=="-1"
end
