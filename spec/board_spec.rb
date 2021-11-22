require 'board'

describe Board do
  describe '.initialize' do
    it 'has a row of length 9' do
      expect(subject.field.length).to eq 9
    end
  end

  describe '.display' do
    it 'prints the field to stdout' do
      expect{subject.display}.to output("  A B C\n1 . . .\n2 . . .\n3 . . .\n").to_stdout
    end
  end

  describe '.get_index' do
    it 'returns 0 for A1' do
      expect(subject.get_index('A1')).to eq 0
    end

    it 'returns 3 for B1' do
      expect(subject.get_index('B1')).to eq 3
    end

    it 'returns 7 for C2' do
      expect(subject.get_index('C2')).to eq 7
    end
  end

  describe '.turn' do
    it 'updates the board with the turn' do
      subject.turn('A1')
      expect(subject.field.turn).to eq ['X', '.', '.', '.', '.', '.', '.', '.', '.']
    end

    it 'changes from X to O on second turn' do
      subject.turn('B2')
      expect(subject.field.turn).to eq ['X', '.', '.', '.', 'O', '.', '.', '.', '.']
    end
  end
end