module Lexicon
  def self.scan(input)
    words = input.split
    directions = ['north','south','east','west','down','up','right','left','back']
    verbs = ['go','stop','kill','eat']
    nouns = ['door','bear','princess','cabinet']
    stop_words = ['the','in','of','from','at','it']
    @@sentence = []

    def self.push_to_sentence(word,type)
      pair = [type , word]
      @@sentence.push(pair)
    end

    def self.check_if_number(word)
      if word.to_i.to_s == word
        push_to_sentence(word.to_i,'number')
      else
        push_to_sentence(word,'error')
      end
    end

    words.each do |word|
      if directions.include? word
        push_to_sentence(word,'direction')
      elsif verbs.include? word
        push_to_sentence(word,'verb')
      elsif nouns.include? word
        push_to_sentence(word,'noun')
      elsif stop_words.include? word
        push_to_sentence(word,'stop')
      else
      check_if_number(word)
      end
    end
  return @@sentence
  end
end
#end

