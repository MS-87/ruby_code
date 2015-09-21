class Grid

    @@grid = []
    @@colors = []

    def initialize(xLen, yLen)
        @xLen = xLen
        @yLen = yLen
        @color = 0
        @xPos = 0
        @yPos = 0
        @@colors << [@color, 0]
        populate_grid

    end

    def populate_grid
      #double loop, push the appropriate number of '0's to the array
      (0..@yLen-1).each do |y|
        @@grid <<[0]
        (0..@xLen-1).each do |x|
          @@grid[y] << 0
        end
      end
    end

    def print_grid
      #same logic, but displays the array
      (0..@yLen-1).each do |y|
        (0..@xLen-1).each do |x|
          print @@grid[y][x]
        end
          puts ""
      end
      puts ""
    end

    def print_solution
      #This part prints the result
        (0..@@colors.length-1).each do |b|
            print @@colors[b][0]
            print " "
            print @@colors[b][1]
            puts ""
        end     
    end

    def count_colors
      #Horribly inneficient tripple nested loop with an if statement
      (0..@yLen-1).each do |y|
        (0..@xLen-1).each do |x|
          (0..@@colors.length-1).each do |z|
            if @@grid[y][x] == @@colors[z][0]
                @@colors[z][1] += 1
            end
          end
        end
      end
    end

end

class Sheet < Grid

    def initialize(color, xPos, yPos, xLen, yLen)
        @color = color
        @xPos = xPos
        @yPos = yPos
        @xLen = xLen
        @yLen = yLen
        @@colors << [@color, 0]
        add_sheet
    end

    def add_sheet
      (@yPos..(@yPos + @yLen-1)).each do |y|
        (@xPos..(@xPos + @xLen-1)).each do |x|
          @@grid[y][x] = @color
        end
      end

    end

end

input1 = Grid.new(20, 10)
sheet1 = Sheet.new(1, 5, 5, 10, 3)
sheet2 = Sheet.new(2, 0, 0, 7, 7)

input1.count_colors
input1.print_grid
input1.print_solution