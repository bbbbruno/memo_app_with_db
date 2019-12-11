# frozen_string_literal: true

class Memo
  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end

  def save
    File.open("db/#{@title}.txt", 'w') do |f|
      f.puts @title
      f.puts @content
    end
  end
end
