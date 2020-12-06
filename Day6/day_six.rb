#Part one
input = File.read('day_six.txt').split("\n\n").map{ |line|  line.gsub(/\n/, "").chars.uniq.count}.sum
print input