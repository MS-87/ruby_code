#get input and set to variable
t = gets.chomp
input = []
t.to_i.times { input << gets.chomp }

#remove spaces, special characters, capital letters
sentence = input.join.scan(/[a-zA-Z0-9]/).join.downcase

#determine if sentence is a palindrome
if sentence == sentence.reverse
	puts "Palindrome"
else
	puts "Not a Palindrome"
end