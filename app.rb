require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/stylist")
  require("pg")

  DB = PG.connect({:dbname => "hair_salon"})
