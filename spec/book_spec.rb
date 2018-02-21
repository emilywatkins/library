require("spec_helper")

describe(".all") do
  it("starts off with no books") do
    expect(Book.all()).to(eq([]))
  end
end

describe("#save") do
  it("lets you save books to the database") do
    book = Book.new({:id => nil, :title => "book title", :author => "book author"})
    book.save()
    expect(Book.all()).to(eq([book]))
  end
end

describe("#id") do
  it("sets its ID when you save it") do
    book = Book.new({:id => nil, :title => "book title", :author => "book author"})
    book.save()
    expect(book.id()).to(be_an_instance_of(Fixnum))
  end
end

describe("#==") do
    it("is the same book if it has the same name and author") do
      book1 = Book.new({:id => nil, :title => "book title", :author => "book author"})
      book2 = Book.new({:id => nil, :title => "book title", :author => "book author"})
      expect(book1).to(eq(book2))
    end
  end
