# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'top'
  erb :index
end

get '/new' do
  @title = 'new page'
  erb :new
end

post '/' do
  render :index
end

get '/:id' do |id|
  @title = 'show page'
  erb :show
end

get '/markdown_template_page' do
  markdown :markdown_template_page
end
