require_relative '../rental'

describe Rental do
  context 'Testing Rental class' do
    before :each do
      @person = Person.new(age: 27, name: 'selase', parent_permission: true)
      @book = Book.new('Book-1', 'Author-1')
      @rental = Rental.new('2020/03/12', @book, @person)
    end

    it 'returns instance of Rental' do
      expect(@rental).to be_instance_of(Rental)
    end

    it 'returns book rental as instance of Book' do
      expect(@rental.book).to be_instance_of(Book)
    end

    it 'returns person rental as instance of Person' do
      expect(@rental.person).to be_instance_of(Person)
    end

    it 'has date' do
      expect(@rental.date).to eq '2020/03/12'
    end
  end
end
