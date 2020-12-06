input = File.read('day_six.txt').split("\n\n").map{|group| group.split("\n").map(&:chars) }

print input.map { |group| group.reduce { |acc, answers| 
    acc & answers }.size 
}.sum