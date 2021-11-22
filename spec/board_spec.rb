
require "board"

describe Board do
  describe ".initialize" do
    it "has a row of length 9" do
      expect(subject.field.length).to eq 9
    end
  end

  describe ".display" do
    it "prints the field to stdout" do
      expect { subject.display }.to output("  A B C\n1 . . .\n2 . . .\n3 . . .\n").to_stdout
    end
  end

  describe ".get_index" do
    it "returns 0 for A1" do
      expect(subject.get_index("A1")).to eq 0
    end

    it "returns 3 for B1" do
      expect(subject.get_index("B1")).to eq 3
    end

    it "returns 7 for C2" do
      expect(subject.get_index("C2")).to eq 7
    end
  end

  describe ".turn" do
    it "updates the board with the turn" do
      subject.turn("A1")
      expect(subject.field).to eq ["X", ".", ".", ".", ".", ".", ".", ".", "."]
    end

    it "changes from X to O on second turn" do
      subject.turn("A1")
      subject.turn("B2")
      expect(subject.field).to eq ["X", ".", ".", ".", "O", ".", ".", ".", "."]
    end

    it "throws an error if the cell is already full" do
      subject.turn("A1")
      expect { subject.turn("A1") }.to raise_error "You cannot claim this cell."
    end
  end

  describe ".win? horizonal" do
    it "returns true if horizontal line" do
      subject.turn("A1")
      subject.turn("B2")
      subject.turn("A2")
      subject.turn("C3")
      subject.turn("A3")
      expect(subject.win?).to be true
    end
  end

  describe ".win? vertical" do
    it "returns true if vertical line" do
      subject.turn("A2")
      subject.turn("B1")
      subject.turn("B2")
      subject.turn("C3")
      subject.turn("C2")
      expect(subject.win?).to be true
    end
  end
  describe "win? diagonal" do
    it "returns true if diagonal line" do
      subject.turn("A1")
      subject.turn("B1")
      subject.turn("B2")
      subject.turn("A3")
      subject.turn("C3")
      expect(subject.win?).to be true
    end
  end
end
