# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

get '/' do
  @title = 'top'
  erb :index
end

get '/new/?' do
  @title = 'new page'
  erb :new
end

post '/' do
  @memo = Memo.new(params[:title], params[:content])
  @memo.save
  redirect '/'
  erb :index
end

get '/:title/?' do |title|
  @memo = Memo.find(title)
  erb :show
end

get '/:title/edit/?' do
  @memo =
  erb :edit
end
