class Board
  attr_reader :field

  WINNING_FIELDS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def initialize
    @field = [".", ".", ".", ".", ".", ".", ".", ".", "."]
    @turns = []
  end

  def display
    print "  A B C\n"
    n = 1
    @field.each_slice(3).to_a.each do |row|
      print "#{n} " + row.join(" ") + "\n"
      n += 1
    end
  end

  def get_index(location)
    case location
    when "A1"
      0
    when "A2"
      1
    when "A3"
      2
    when "B1"
      3
    when "B2"
      4
    when "B3"
      5
    when "C1"
      6
    when "C2"
      7
    when "C3"
      8
    end
  end

  def turn(location)
    index = get_index(location)
    raise "You cannot claim this cell." if @field[index] != "."
    if @turns.length % 2 == 0
      @field[index] = "X"
    else
      @field[index] = "O"
    end
    @turns << location
  end
end
