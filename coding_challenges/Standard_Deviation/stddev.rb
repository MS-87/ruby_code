#problem was too easy, decided to implement my own sqr and sqrt function
def squareRoot(number, low =nil, high=nil, itterations=100)
  #first time it's called, establish low and high ceiling
  if low.nil? && high.nil?
    low = 0
    high = number
  end

  #average between the high guess and low guess
  average = (low.to_f+high.to_f)/2

  # if the square root of the average is too high set the high variable to average
  # if the square root of the average is too low, set the low variable to average
  # Using recurison, this will zero-in to a value that is close to actual sqrt
  if ((average*average) > number) && itterations > 0
    average = squareRoot(number, low, average, itterations-=1)

  elsif ((average*average) < number) && itterations > 0
    average = squareRoot(number, average, high, itterations-=1)
  end

  return average

end

def standardDeviation(population)
    #find mean
    sum = 0
    population.each {|v| sum+=v}
    mean = sum/population.length.to_f

    #find variance
    sum = 0
    population.each {|k| sum += (k-mean)**2}    
    var = sum/population.length.to_f

    #find standard deviation - rounded to 4 places
    return squareRoot(var).round(4)
end

puts standardDeviation([5,6,11,13,19,20,25,26,28,37])
puts standardDeviation([37, 81, 86, 91, 97, 108, 109, 112, 112, 114, 115, 117, 121, 123, 141])
puts standardDeviation([266, 344, 375, 399, 409, 433, 436, 440, 449, 476, 502, 504, 530, 584, 587])
puts standardDeviation([809, 816, 833, 849, 851, 961, 976, 1009, 1069, 1125, 1161, 1172, 1178, 1187, 1208, 1215, 1229, 1241, 1260, 1373])