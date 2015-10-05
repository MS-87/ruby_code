require 'benchmark'
# struct which will define our points
Point = Struct.new(:x, :y)

#Compare distance of 2 points
def distance(pt1, pt2)
  Math.sqrt((pt1.x - pt2.x)**2 + (pt1.y - pt2.y)**2) 
end

#brute force method for finding closest point.
#Will only be used in cases where N<3
def compare_all(points)
  return Float::INFINITY, nil, nil if points.size <= 1

  #compare every possible combination
  min = Float::INFINITY
  p1 = nil
  p2 = nil
  points[0..-1].each_index do |i|
    k = 1 + i
    while k < points.size do
      dist = distance(points[i], points[k])
      if dist < min
        min = dist
        p1 = points[i]
        p2 = points[k]
      end
      k+=1
    end
  end

  return min,p1,p2
end

#--Use divide and conquer to find closest pair of points
#--receive points sorted by "x" point, receive points sorted by "y" point
def closest_pair(xp, yp)

  n = (xp.size) -1

  #find distance using brute-force once there are less than 3 points
  return compare_all(xp) if n <= 2

  #split points by left and right, define mid-point
  xl = xp[0..n/2]
  xr = xp[(n/2)+1..-1]
  xm = xp[n/2].x

  yl = yp.find_all {|i| i.x <= xm}
  yr = yp.find_all {|i| i.x > xm}

  #using recursion to split down the sets to max 3 points, keep smaller of the two
  lmin, lpt1, lpt2 = closest_pair(xl, yl)
  rmin, rpt1, rpt2 = closest_pair(xr, yr)
  dmin, pt1, pt2 = lmin<rmin ? [lmin, lpt1, lpt2] : [rmin, rpt1, rpt2]

  #find all points (sorted by y-points), who'se distance from xm is less than dmin
  ypMin = yp.find_all {|i| (i.x - xm).abs <= dmin}
  yn = ypMin.size

  cd, cp1, cp2 = dmin, pt1, pt2

  #iterate through all points in defined range, find closest point between itself, or dmin, store it
  ypMin.each_index do |i|
    k = 1 + i
    while k < yn && (ypMin[k].y - ypMin[i].y) < dmin do
      dist = distance(ypMin[i], ypMin[k])
      if dist < cd
        cd = dist
        cp1 = ypMin[i]
        cp2 = ypMin[k]
      end
      k+=1
    end
  end

  return cd, cp1, cp2
end

# Receives unsorted points, sorts by x and y
# calls closest_pair, returns result of cloesst_pair
def closest_house(points)
  xp = points.sort_by(&:x)
  yp = points.sort_by(&:y)
  closest_pair(xp,yp)
end

#open file, then store points into array of Point structs (:x, :y)
#More compact way to do this?

#16 inputs
puts "16-point input"
arr = []
points = []
File.foreach('./16_input') {|i| arr << i.scan(/\d\.\d+/)}
arr[1..-1].each_index do |x|
  points << Point.new(arr[x+1][0].to_f, arr[x+1][1].to_f)
end

d,dx,dy = closest_house(points)
puts "Minimum Distance: #{d}"
puts dx
puts dy
puts

#100 inputs
puts "100-point input"
arr = []
points = []
File.foreach('./100_input') {|i| arr << i.scan(/\d\.\d+/)}
arr[1..-1].each_index do |x|
  points << Point.new(arr[x+1][0].to_f, arr[x+1][1].to_f)
end

d,dx,dy = closest_house(points)
puts "Minimum Distance: #{d}"
puts dx
puts dy
puts

#5000 inputs
puts "5000-point input"
arr = []
points = []
File.foreach('./5000_input') {|i| arr << i.scan(/\d\.\d+/)}
arr[1..-1].each_index do |x|
  points << Point.new(arr[x+1][0].to_f, arr[x+1][1].to_f)
end

d,dx,dy = closest_house(points)
puts "Minimum Distance: #{d}"
puts dx
puts dy
puts

#100,000 inputs
puts "100,000-point input"
arr = []
points = []
File.foreach('./100000_input') {|i| arr << i.scan(/\d\.\d+/)}
arr[1..-1].each_index do |x|
  points << Point.new(arr[x+1][0].to_f, arr[x+1][1].to_f)
end

d,dx,dy = closest_house(points)
puts "Minimum Distance: #{d}"
puts dx
puts dy
puts

puts "Benchmark for 100,000 points (s):"
#print "Brute Force:"
#puts Benchmark.measure {compare_all(points)}
print "Div & Conq : "
puts Benchmark.measure {closest_house(points)}