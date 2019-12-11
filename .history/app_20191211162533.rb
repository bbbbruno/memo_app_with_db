# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello'
  'goodbye'
end

get '/hello/:fname/?' do |f|
  "hello #{f}"
end
