input = File.readlines("day_eight.txt").map{|line| line.split(" ")}

count = 0 
i = 0
executed = []

while !executed.include?(i)
    
    executed << i

    case input[i][0]
    when "acc"
        count += input[i][1].to_i
    when "jmp"
        i += (input[i][1].to_i - 1)
    end
    i+=1
end
print count