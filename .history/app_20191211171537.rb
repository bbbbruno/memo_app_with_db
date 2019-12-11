# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

get '/' do
  erb :index
end

get '/new/?' do
  erb :new
end

post '/' do |title, content|
  @memo = Memo.new(title, content)
  @memo.save
  redirect '/'
  erb :index
end

get '/:id/?' do |id|
  erb :show
end

get '/:id/edit/?' do
  @memo =
  erb :edit
end
