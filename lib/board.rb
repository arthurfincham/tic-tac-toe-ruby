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
end