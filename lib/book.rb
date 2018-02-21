class Book
  attr_reader(:id, :title, :author)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
  end

  def self.all
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      id = book.fetch("id").to_i
      title = book.fetch("title")
      author = book.fetch("author")
      books.push(Book.new({:id => id, :title => title, :author => author}))
    end
    books
  end
end
