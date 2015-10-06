require 'prime'

#returns all factors (no repetition) for 1 number
def factors(num)
  pn = num.prime_division
  ans = []
  pn.each_index do |i|
    ans << pn[i][0]
  end
  return ans
end

#takes two numbers and returns t/f if they are RA_pairs
def RA_pairs?(p)
  num1 = factors(p[0])
  num2 = factors(p[1])
  a = (num1 - (num1 & num2)).inject(:+)
  b = (num2 - (num1 & num2)).inject(:+)
  a == b ? (return true) : (return false)
end

#prints valid or not valid.
def ruth_aaron(nums)
  print "(#{nums[0]}, #{nums[1]}): "
  print "NOT " if !RA_pairs?(nums)
  print "VALID.\n"
end

in1 = <<INPUT
  (714,715)
  (77,78)
  (20,21)
INPUT
set1 = in1.split("\n")
set1.each do |v|
  a = v.scan(/\d+/).map(&:to_i)
  ruth_aaron(a)
end
puts
in2 = <<INPUT
  (5,6) 
  (2107,2108) 
  (492,493) 
  (128,129) 
INPUT
set2 = in2.split("\n")
set2.each do |v|
  a = v.scan(/\d+/).map(&:to_i)
  ruth_aaron(a)
end


