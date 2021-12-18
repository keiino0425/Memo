require "csv"

# ファイルを作成する
def write
  # タイトルを取得する
  puts "拡張子を除いたファイル名を入力してください"
  title = gets.to_s.chomp
  
  puts "メモしたい内容を記入してください"
  puts "完了したら ctrl + Dを押します"
  
  
  # textに記入されたメモを保存する
  CSV.open(title + ".csv","w") do |text|
    content = readlines.map(&:chomp)
    text << content
  end
end

# ファイルの内容を取得する
def read
  # タイトルを取得する
  puts "拡張子を除いたファイル名を入力してください"
  title = gets.chomp
  
  # メモの内容を表示する
  original = CSV.read(title + ".csv")
  
  puts original
  
  puts "追加でメモしたい内容を記入してください"
  puts "完了したら ctrl + Dを押します"
  
  # textに記入されたメモを追記する
  CSV.open(title + ".csv","a") do |text|
    content = readlines.map(&:chomp)
    text << content
  end
end
  
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

# メモを作成か編集か選んでもらう
choice = gets.chomp

# 選んだ数字によって作成か編集か分岐する
if choice == "1"
  write
elsif choice == "2"
  read
else
  puts "1か2を入力してください"
end