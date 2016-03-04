require 'sinatra'
require 'csv'
require 'pry'


get "/favorites" do
  @favorites = CSV.readlines('favorites_list.csv', headers: true)
  erb :index
end

get "/" do
  redirect "/favorites"
end

post "/favorites" do

  favorite = params["favorite"]
  unless favorite.strip.empty?
    CSV.open("favorites_list.csv", "a") do |csv|
      csv << [favorite]
    end
  end
  redirect "/favorites"
end
