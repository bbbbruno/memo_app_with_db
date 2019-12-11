# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello'
  'goodbye'
end

get '/hello/:fname' do |f|
  "hello #{f}"
end

get '/erb_template_page' do
  erb :erb_template_page
end
