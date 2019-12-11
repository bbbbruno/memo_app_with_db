# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello'
  'goodbye'
end

get '/hello/:fname/?:lname?' do |f, l|
  "hello #{f} #{l}"
end
