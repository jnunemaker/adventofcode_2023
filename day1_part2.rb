contents = File.read("day1_input.txt")
lines = contents.split("\n")
words_to_numbers = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
}
values = lines.map do |line|
  digits = line.scan(/\d|one|two|three|four|five|six|seven|eight|nine/)
  digits.map! do |digit|
    words_to_numbers.fetch(digit, digit).to_i
  end
  number = "#{digits.first}#{digits.last}".to_i
  puts "#{number}    #{line} "
  number
end

puts values.sum
