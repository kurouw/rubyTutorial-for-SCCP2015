n=STDIN.gets
arr=STDIN.gets.split.map(&:to_i)
puts "#{arr.min} #{arr.max} #{arr.inject(:+)}"
