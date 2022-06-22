require_relative '../student'

describe Student do
  context 'Testing student class' do
    before :each do
      @student = Student.new(age: 22, name: 'Emily', parent_permission: true)
    end

    it 'returns instance of student' do
      expect(@student).to be_instance_of(Student)
    end

    it 'has name' do
      expect(@student.name).to eq 'Emily'
    end

    it 'has age' do
      expect(@student.age).to eq 22
    end

    it 'has parent_permission' do
      expect(@student.parent_permission).to be true
    end
  end
end
