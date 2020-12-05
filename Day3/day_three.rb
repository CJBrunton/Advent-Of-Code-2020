# Part one
input = File.readlines('day_three.txt').map { |line| line.strip }

trees_encountered = input.each_with_index.count do |line, i|    
    line[(i * 3) % line.length].eql?('#')
end

puts "Solution for day 3 part one: #{trees_encountered}"


# Part two
input = File.read('day_three.txt')

map = input.split("\n").map { |line| line.split('') }

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

puts slopes.map { |dx, dy|
  x = 0
  y = 0
  trees = 0

  while y < map.length - 1
    x += dx
    x %= map[0].length
    y += dy

    trees += 1 if map[y][x] == '#'
  end

  trees
}.inject(:*)