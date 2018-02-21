require("rspec")
require("pg")
require("book")
require("patron")

DB = PG.connect({:dbname => "library_test"}) #connect to test db

RSpec.configure do |config| # clear db between spec runs
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM patrons *;")
  end
end
