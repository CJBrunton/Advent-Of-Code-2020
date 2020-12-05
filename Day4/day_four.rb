input = File.read('day_four.txt').split("\n\n").map do |passport|
    passport.scan(/(\w+{3})\:(\S+)/).to_h
  end

require_fields = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']

#Part one
valid_passport = input.select do |passport|
    require_fields.all? { |field| passport.key?(field) }
end

puts valid_passport.count