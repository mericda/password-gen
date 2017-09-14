require 'sinatra'
require "sinatra/reloader" if development?

length=10


enable :sessions

get '/' do


  return 422
end

error 422 do
"You haz an error"
end

get '/generate-password' do
  @number_array = ("0".."9").to_a
  @lowercase_array = ("a".."z").to_a
  @uppercase_array = ("A".."Z").to_a
  @symbol_array = ("!".."*").to_a
password = (@number_array + @lowercase_array + @uppercase_array + @symbol_array).sample(length).shuffle.join("")
  "#{password}"

end

get '/generate-password/:length' do
  if (6..64).include?(params["length"].to_i)
    length = params["length"].to_i
    redirect to ('/generate-password')
  else
    "Your password should be between 6-64 characters. Please try again."
  end
end
