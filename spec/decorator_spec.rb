require_relative '../decorator'

describe Decorator do
  context 'Testing Decorator class' do
    before :each do
      @person = Person.new(age: 27, name: 'selase', parent_permission: true)
      @decorator = Decorator.new(@person)
      @capitalize = CapitalizeDecorator.new(@person)
      @trimmer = TrimmerDecorator.new(@person)
    end

    it 'returns instance of Decorator' do
      expect(@decorator).to be_instance_of(Decorator)
    end

    it 'returns instance of CapitalizeDecorator' do
      expect(@capitalize).to be_instance_of(CapitalizeDecorator)
    end

    it 'returns instance of TrimmerDecorator' do
      expect(@trimmer).to be_instance_of(TrimmerDecorator)
    end

    it 'returns correct_name for Decorator' do
      expect(@decorator.correct_name).to eq 'selase'
    end

    it 'returns correct_name for CapitalizeDecorator' do
      expect(@capitalize.correct_name).to eq 'Selase'
    end

    it 'returns correct_name for TrimmerDecorator' do
      expect(@trimmer.correct_name[0, 4]).to eq 'sela'
    end
  end
end
