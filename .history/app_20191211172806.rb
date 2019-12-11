# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

get '/' do
  @title = 'top'
  erb :index
end

get '/new/?' do
  erb :new
end

post '/' do
  @memo = Memo.new(params[:title], params[:content])
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
