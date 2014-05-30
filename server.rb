require 'sinatra'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: 'restaurants')

  yield(connection)

  ensure
    connection.close
  end
end

def find_restaurants
  db_connection do |conn|
    conn.exec('SELECT * FROM restaurants')
  end
end


get '/' do
@restaurants = find_restaurants.to_a
erb :index
end


post '/restaurants' do
  restaurant = params["restaurant_name"]
  price = params["price"].to_i
  address = params["address"]
  food = params["food_type"]
  distance = params["distance"]

  query = "INSERT INTO restaurants (name, meal_price, address, food_type, launch_distance) VALUES ('#{restaurant}', '#{price}', '#{address}', '#{food}', '#{distance}')"
  db_connection do |conn|
    conn.exec(query)
  end
  redirect '/'
end

