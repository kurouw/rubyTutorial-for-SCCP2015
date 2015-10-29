a,b=STDIN.gets.split.map(&:to_i)

puts(if a<b then
      'a < b'
    elsif a>b then
      'a > b'
    else
      'a == b'
     end)
