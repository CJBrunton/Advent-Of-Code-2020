require 'set'

input = File.readlines('day_five.txt').map{ |line| 
    row_min, row_max = 0, 127
    column_min, column_max = 0, 7
    calculate_row = 0
    calculate_column = 0
    line.chars.each do |item|
        row_number = (row_min + row_max) /2
        column_number = (column_min + column_max) /2
       case item
       when 'F' 
        row_max = row_number
       when 'B'
        row_min = row_number + 1
       when 'L'
        column_max = column_number
       when 'R'
        column_min = column_number + 1 
       end
       calculate_row = row_number
       calculate_column = column_number
    end 
    (calculate_row * 8) + calculate_column
}
#Answer part 1
puts "Answer one #{input.max}"

#Answer part 2 
ids = input.sort
boarding_pass = (ids.min..ids.max).find { |id|
    ids.include?(id+1) && ids.include?(id-1) && !ids.include?(id)
}
puts "Answer two #{boarding_pass}"