class Checkout
  attr_reader(:id, :book_id, :patron_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @book_id = attributes.fetch(:book_id)
    @patron_id = attributes.fetch(:patron_id)
  end

  def self.all
    returned_checkouts = DB.exec("SELECT * FROM checkouts;")
    checkouts = []
    returned_checkouts.each() do |checkout|
      id = checkout.fetch("id").to_i
      book_id = checkout.fetch("book_id").to_i
      patron_id = checkout.fetch("patron_id").to_i
      checkouts.push(Checkout.new({:id => id, :book_id => book_id, :patron_id => patron_id}))
    end
    checkouts
  end

  def save
    result = DB.exec("INSERT INTO checkouts (book_id, patron_id) VALUES ('#{@book_id}', '#{@patron_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_checkout)
    self.id().==(another_checkout.id()).&(self.book_id().==(another_checkout.book_id())).&(self.patron_id().==(another_checkout.patron_id()))
  end

  def self.find(id)
    found_checkout = nil
    Checkout.all().each() do |checkout|
      if checkout.id().==(id)
        found_checkout = checkout
      end
    end
    found_checkout
  end
end
