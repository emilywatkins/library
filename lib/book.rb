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

  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_book)
    self.title().==(another_book.title()).&(self.author().==(another_book.author())).&(self.id().==(another_book.id()))
  end

  def self.find(id)
    found_book = nil
    Book.all().each() do |book|
      if book.id().==(id)
        found_book = book
      end
    end
    found_book
  end

  def update(attributes) # should this be separated into update_title and update_author?
    @author = attributes.fetch(:author)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE books SET author = '#{@author}' WHERE id = #{@id};")
    DB.exec("UPDATE books SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{self.id()};")
  end
end
