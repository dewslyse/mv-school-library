require_relative '../nameable'

describe Nameable do
  context 'Testing Nameable class' do
    before :each do
      @nameable = Nameable.new
    end

    it 'raises error' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
