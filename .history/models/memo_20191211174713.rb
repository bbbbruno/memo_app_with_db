# frozen_string_literal: true

class Memo
  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end

  def save
    File.open("db/#{title}.rb", 'w') do |f|
      f.puts "title: #{title}content: #{content}"
    end
  end
end
