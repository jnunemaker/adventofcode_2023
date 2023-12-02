contents = File.read("day2_input.txt")
lines = contents.split("\n")

CubeReveal = Struct.new(:sets) do
  LIMITS = {
    "red" => 12,
    "green" => 13,
    "blue" => 14,
  }

  def possible?
    sets.all? { |set| set.number <= LIMITS[set.color] }
  end
end
CubeSet = Struct.new(:number, :color)

values = lines.map do |line|
  matches = line.scan(/Game (\d+)\: (.*)/).first
  id = matches[0].to_i
  reveals = matches[1].split(";").map(&:strip).map { |reveal|
    CubeReveal.new(reveal.split(",").map(&:strip).map { |cube_line|
      number, color = cube_line.split(" ").map(&:strip)
      number = number.to_i
      CubeSet.new(number, color)
    })
  }
  # puts line
  # pp id: id, reveals: reveals
  reveals.all?(&:possible?) ? id : 0
end

puts values.sum
