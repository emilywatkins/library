require('spec_helper')

describe(".all") do
  it("starts off with no checkouts") do
    expect(Checkout.all()).to(eq([]))
  end
end

describe("#save") do
  it("lets you save books and patrons to the database") do
    book = Book.new({:id => nil, :title => "book title", :author => "book author"})
    book.save()
    patron = Patron.new({:id => nil, :name => "patron name"})
    patron.save()
    checkout = Checkout.new({:id => nil, :book_id => book.id.to_i, :patron_id => patron.id.to_i})
    checkout.save()
    expect(Checkout.all()).to(eq([checkout]))
  end
end

describe("#id") do
  it("sets its ID when you save it") do
    checkout = Checkout.new({:id => nil, :book_id => 1, :patron_id => 1})
    checkout.save()
    expect(checkout.id()).to(be_an_instance_of(Fixnum))
  end
end

describe("#==") do
  it("is the same checkout if it has the same content and id") do
    checkout1 = Checkout.new({:id => nil, :book_id => 1, :patron_id => 1})
    checkout2 = Checkout.new({:id => nil, :book_id => 1, :patron_id => 1})
    expect(checkout1).to(eq(checkout2))
  end
end

describe(".find") do
  it("returns a checkout by its ID") do
    checkout1 = Checkout.new({:id => nil, :book_id => 1, :patron_id => 1})
    checkout1.save()
    checkout2 = Checkout.new({:id => nil, :book_id => 2, :patron_id => 2})
    checkout2.save()
    expect(Checkout.find(checkout2.id())).to(eq(checkout2))
  end
end
