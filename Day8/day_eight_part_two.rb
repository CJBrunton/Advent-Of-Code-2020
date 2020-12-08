require 'set'

input = File.read('day_eight.txt')

def run(ops)
  i = 0
  acc = 0
  executed = Set.new

  while i < ops.size
    return nil if executed.include?(i)
    executed.add(i)

    op, arg = ops[i].split
    arg = arg.to_i

    case op
    when "acc"
      acc += arg
    when "jmp"
      i += arg - 1
    end

    i += 1
  end

  acc
end

ops = input.split("\n")

ops.size.times do |i|
  fixed_ops = ops.map(&:clone)

  instr = fixed_ops[i]

  if instr =~ /jmp/
    instr.gsub!("jmp", "nop")
  elsif instr =~ /nop/
    instr.gsub!("nop", "jmp")
  else
    next
  end

  acc = run(fixed_ops)

  if acc
    puts acc
    exit
  end
end