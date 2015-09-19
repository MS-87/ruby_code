=begin
#less elegant solution
(1..100).each do |i|
	if i%3 == 0 and i%5 == 0
		puts "FizzBuzz"
	elsif i%3 == 0
		puts "Fizz"
	elsif i%5 == 0
		puts "Buzz"
	else
		puts i
	end
end
=end

#Better version
(1..100).each do |i|
	res = nil
	if i%3 == 0
		res = res.to_s + "Fizz"
	end
	if i%5 == 0
		res = res.to_s + "Buzz"
	end
		puts res ||= i
end