module Ex25

	# This function will break up words for us
	# What does split do?
	def Ex25.break_words(stuff)
		words = stuff.split(' ')
		return words
	end
	
	# Sorts the words.
	def Ex25.sort_words(words)
		return words.sort
	end
	
	#prints the first word after shifting it off
	#What does shift do?
	def Ex25.print_first_word(words)
		word = words.shift
		puts word
	end
	
	# Prints the last word after popping it off.
	def Ex25.print_last_word(words)
		word = words.pop
		puts word
	end
	
	#takes in a full sentence and returns the sorted words.
	def Ex25.sort_sentence(sentence)
		words = Ex25.break_words(sentence)
		return Ex25.sort_words(words)
	end
	
	# Prints the first and last words of the sentence.
	def Ex25.print_first_and_last(sentence)
		words = Ex25.break_words(sentence)
		Ex25.print_first_word(words)
		Ex25.print_last_word(words)
	end
	
	# Sorts the words and then prints the first and last one.
	def Ex25.print_first_and_last_sorted(sentence)
		words = Ex25.sort_sentence(sentence)
		Ex25.print_first_word(words)
		Ex25.print_last_word(words)
	end
	
end
