# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

get '/' do
  @title = 'top'
  @memos = Memo.all
  erb :index
end

get '/new' do
  @title = 'new'
  erb :new
end

post '/' do
  data = { title: params[:title], content: params[:content] }
  @memo = Memo.new(data)
  @memo.save
  redirect '/'
  erb :index
end

get '/:id' do |id|
  @title = 'show'
  @memo = Memo.find(id)
  erb :show
end

get '/:id/edit' do |id|
  @title = 'edit'
  @memo = Memo.find(id)
  erb :edit
end

put '/:id' do |id|
  @memo = Memo.find(id)
  @memo.title = params[:title]
  @memo.content = params[:content]
  @memo.update
  erb :show
end

delete '/:id' do |id|
  Memo.destroy(id)
  redirect '/'
  erb :index
end
