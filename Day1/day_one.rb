
# testInput = [1721, 979,366,299,675,1456] 
part_one = 2
part_two = 3

input = File.read('day_one.txt')
inputNumbers = input.strip.split(' ').map(&:to_i)
correct_combinations = inputNumbers.combination(part_two).find { |c| c.sum == 2020 }
puts correct_combinations.inject(:*)