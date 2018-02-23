require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/book")
require("./lib/patron")
require("pg")
require("pry")
require("pry-nav")

# DB = PG.connect({:dbname => "library"}) #connect to NON-TEST db

DB = PG.connect({:dbname => "library"}) # change back to above when done testing

get('/') do
  erb(:index)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

post('/books') do
  title = params['title']
  author = params['author']
  book = Book.new({:id => nil, :title => title, :author => author})
  book.save()
  @books = Book.all()
  erb(:books)
end

get('/books/:id') do
  @books = Book.all()
  @book = Book.find(params.fetch('id').to_i())
  erb(:book)
end

patch('/books/:id') do
  @book = Book.find(params['id'].to_i)
  title = @book.title
  author = @book.author
  if params['title'] != '' && params['title'] != nil
    title = params['title']
  end
  if params['author'] != '' && params['author'] != nil
    author = params['author']
  end
  @book.update({:title => title, :author => author})
  erb(:book)
end
