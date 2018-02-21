class Book
  attr_reader(:id, :title, :author)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
  end

  def self.all
    
  end
end
