require_relative '../book'

describe Book do
  context 'When testing Book class' do
    before :each do
      @book = Book.new('Book-1', 'Author-1')
    end

    it 'returns instance of Book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'has title' do 
      expect(@book.title).to eq 'Book-1'
    end

    it 'has author' do
      expect(@book.author).to eq 'Author-1'
    end
  end
end