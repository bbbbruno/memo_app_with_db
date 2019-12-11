# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'top'
  erb :index
end

get '/new' do
  
end

get '/erb_template_page' do
  erb :erb_template_page
end

get '/markdown_template_page' do
  markdown :markdown_template_page
end
