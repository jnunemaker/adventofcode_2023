# part 1
contents = File.read("day1_input.txt")
lines = contents.split("\n")

values = lines.map do |line|
  digits = line.scan(/\d/)
  number = "#{digits.first}#{digits.last}".to_i
  puts "#{number}    #{line} "
  number
end

puts values.sum
