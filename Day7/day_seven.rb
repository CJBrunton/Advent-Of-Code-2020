require 'set'

input = File.read('day_seven.txt')

parent_bag = Hash.new { |hash, key| hash[key] = Array.new }

input.split("\n").each do |line|
  parent, contain = line.match(/(\w+ \w+) bags contain (.*)\./)[1..2]

  children = contain.split(",")
    .map { |child| child.match(/(\w+ \w+) bag/)[1] }
    .compact

  children.each do |child|
    parent_bag[child] << parent
  end
end

bag_colours = Set.new
queue = ["shiny gold"]

while queue.any?
  child = queue.shift

  parent_bag[child].each do |parent|
    bag_colours.add(parent)
    queue << parent
  end
end

puts bag_colours.size