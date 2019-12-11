# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

enable :method_override

get '/' do
  @title = 'top'
  erb :index
end

get '/new/?' do
  @title = 'new page'
  @memo = Memo.new
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

get '/:title/edit/?' do |title|
  @memo = Memo.find(title)
  erb :edit
end

delete '/:title/?' do |title|
  Memo.destroy(title)
  

end
