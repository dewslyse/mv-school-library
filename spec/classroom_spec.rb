require_relative '../classroom'

describe Classroom do
  context 'Testing classroom class' do
    before :each do
      @classroom = Classroom.new(251)
      @student = Student.new(age: 22, name: 'Emily', parent_permission: true, classroom: @classroom)
    end

    it 'returns an instance of classroom' do
      expect(@classroom).to be_instance_of(Classroom)
    end

    it 'has label' do
      expect(@classroom.label).to eq 251
    end

    it 'has students' do
      expect(@classroom.students[0].name).to eq @student.name
    end
  end
end