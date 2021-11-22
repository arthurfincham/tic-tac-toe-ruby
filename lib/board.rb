class Board
  attr_reader :field
  def initialize
    @field = ['.', '.', '.', '.', '.', '.', '.', '.', '.']
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
end