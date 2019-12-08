
def collatzr(n)
  return 1 if n == 1
  return 1 + collatzr( n.odd? ? n * 3 + 1 : n / 2)
end

def max_collatz(n)
  max = -3200000000000
  max_result = 0
  n.times do |i|
    c = collatzr(i+1)
    if c > max then
      max = c
      max_result = i+1
    end
  end
  return [max_result,max]
end
puts collatzr(7)
puts max_collatz(1000000).inspect

def collatz(n)
  length = 1
  #start with length of 1 to include starting value
  return n if n == 1
  while n != 1 do
    length += 1
    n = n.even? ? n/2 : n*3+1
  end
  return length
end
puts collatz(7)



  