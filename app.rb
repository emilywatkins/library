require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/book")
require("./lib/patron")
require("pg")

# DB = PG.connect({:dbname => "library"}) #connect to NON-TEST db

DB = PG.connect({:dbname => "library_test"}) # change back to above when done testing
