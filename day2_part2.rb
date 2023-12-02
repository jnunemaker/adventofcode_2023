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

  def blues
    sets.select { |set| set.color == "blue" }
  end

  def blue_max
    blues.map(&:number).max
  end

  def reds
    sets.select { |set| set.color == "red" }
  end

  def red_max
    reds.map(&:number).max
  end

  def greens
    sets.select { |set| set.color == "green" }
  end

  def green_max
    greens.map(&:number).max
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

  blue_max = reveals.map(&:blue_max).compact.max
  red_max = reveals.map(&:red_max).compact.max
  green_max = reveals.map(&:green_max).compact.max
  blue_max * red_max * green_max
end

puts values.sum
