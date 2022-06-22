require_relative '../teacher'

describe Teacher do
  context 'Testing teacher class' do
    before :each do
      @teacher = Teacher.new(age: 22, name: 'Emily', specialization: 'Music')
    end

    it 'returns instance of teacher' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it 'has name' do
      expect(@teacher.name).to eq 'Emily'
    end

    it 'has age' do
      expect(@teacher.age).to eq 22
    end

    it 'has specialization' do
      expect(@teacher.specialization).to eq 'Music'
    end
  end
end