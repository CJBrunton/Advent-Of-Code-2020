# input = File.read('day_two.txt')
# addCommas = input.gsub! ' ' , ','
# addCommas.split(',')
# readyInput = []
# validPasswordsPart1 = 0
# validPasswordsPart2 = 0

# addCommas.each_line do |line|
#    readyInput << line.strip.split(',')
# end 

# readyInput.each_with_index do |item, index|
#     range = item[0].split('-')
#     lowerLimit = range[0].to_i 
#     upperLimit = range[1].to_i 
#     letter = item[1].tr(':' , ' ')
#     password = item [2]

#     # Part one
#     if password.count(letter) <= upperLimit && password.count(letter) >= lowerLimit
#         validPasswordsPart1 += 1
#     end

#     # Part two
#     if (password.chars[lowerLimit-1].to_str.strip == letter.to_str.strip && password.chars[upperLimit-1].to_str.strip != letter.strip) || (password.chars[lowerLimit-1].strip != letter.strip && password.chars[upperLimit-1].strip == letter.strip)
#         validPasswordsPart2 +=1
#     end
# end
# puts "Part one total #{validPasswordsPart1}"
# puts "Part two total #{validPasswordsPart2}"


# Refactor
input = File.readlines('day_two_test.txt')

data = input.map do |line|
  policy, password = line.split(':')
  range, letter = policy.split(' ')
  lower, higher = range.split('-').map(&:to_i)
  {
    letter: letter,
    password: password.strip,
    lower: lower,
    higher: higher
  }
end
valid_1 = data.select do |entry|
  entry[:password]
    .count(entry[:letter])
    .between?(entry[:lower], entry[:higher])
end
valid_2 = data.select do |entry|
  entry[:password]
    .chars
    .values_at(entry[:lower].pred, entry[:higher].pred)
    .count(entry[:letter]) == 1
end
puts valid_1.count
puts valid_2.count