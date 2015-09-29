def vampire_num(digits)
  n = digits[0].to_i #digits in answer
  m = digits[1].to_i #number of fangs
  mulvals = [] #Stores multiplication values

  Array.new(m, 10)
  iterate(mulvals, n, m-1, 0)

end

def iterate(mulvals, n, m, p)
  (10..99).each do |i|
    mulvals[p] = i
    if p < m
      iterate(mulvals, n, m, p+1) #recursion!
    end
    compare(mulvals,n, m)
  end

end

def compare(mulvals, n, m)
  ans = 1
  mulvals.each {|i| ans*=i}

  #break apart the answer and the digits into single digit, sorted arrays and compare them
  vam = ans.to_s.split("").sort
  fan = mulvals.join.split("").sort

  if vam == fan
    print ans.to_s+"="
    mulvals[0..-2].each {|i| print i.to_s+"*"}
    puts mulvals[-1]
  end
end


input = gets.chomp.split(" ")
vampire_num(input)
