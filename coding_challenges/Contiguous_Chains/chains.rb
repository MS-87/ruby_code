class Coordsys
  #Each individual point is a Struct
  Point = Struct.new(:val, :x, :y, :check, :chain)

  def initialize(input, r, c)
    @r = r.to_i
    @c = c.to_i

    #empty array r by c
    @coordsys = Array.new(r.to_i) {Array.new(c.to_i)}
    @chain_num = 0

    #New array, this array is made up of point Structs, determined by 'input'
    input.each_with_index do |v1, i1|
      input[i1].each_with_index do |v2, i2|
        @coordsys[i1][i2] = Point.new(false, i2, i1, false, "")
        if v2 == "x"
          #val = true if input was 'x'
          @coordsys[i1][i2].val = true
        end
      end
    end
    count_chains
  end

  def count_chains
    #puts @coordsys #for testing
    @coordsys.each_with_index do |v1, i1|
      @coordsys[i1].each_with_index do |v2,i2|
        if check_point(@coordsys[i1][i2], i1, i2)
          @chain_num += 1
        end
      end
    end
    puts "#{@chain_num} total chains."
  end

  def check_point(point, i1, i2)
    #Check if point is a valid chain candidate
    if !point.check and point.val
      @coordsys[i1][i2].check = true
      #If so, set the Point Struct .chain value
      @coordsys[i1][i2].chain = @chain_num+1

      #call function (recursion) on all 4 adjecent cells
      if (i1+1 < @r) and !(@coordsys[i1+1][i2].check)
        check_point(@coordsys[i1+1][i2], i1+1, i2)
      end

      if (i1-1 >= 0) and !(@coordsys[i1-1][i2].check)
        check_point(@coordsys[i1-1][i2], i1-1, i2)
      end

      if (i2+1 < @c) and !(@coordsys[i1][i2+1].check)
        check_point(@coordsys[i1][i2+1], i1, i2+1)
      end

      if (i2-1 >= 0) and !(@coordsys[i1][i2-1].check)
        check_point(@coordsys[i1][i2-1], i1, i2-1)
      end
      return true
    end
    @coordsys[i1][i2].check = true
    return false

  end

end

#get dimension input (R, C)
t = gets.chomp.split
r = t[0]
c = t[1]
input1 = []
r.to_i.times { input1 << gets.chomp.split("")}

example1 = Coordsys.new(input1, r, c)
