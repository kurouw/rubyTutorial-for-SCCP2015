n=STDIN.gets
arr=STDIN.gets.split.map(&:to_i)
arr2 = Array[]
arr2[0] = arr.inject(-1000000) do |a, i|
  a= a > i ? a:i
end

arr2[1] = arr.inject(1000000) do |a, i|
  a= a < i ? a:i
end
arr2[2] =arr.inject(:+)

print arr2
