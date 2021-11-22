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
end