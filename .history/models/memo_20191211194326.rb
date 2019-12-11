# frozen_string_literal: true

require 'fileutils'

class Memo
  attr_accessor :title, :content

  def initialize(title = '', content = '')
    @title = title
    p content.gsub(/\R/, "\n")
    @content = content.gsub(/\R/, "\n")
  end

  class << self
    def all
      Dir.open('db').each_child.with_object([]) do |f, a|
        a << f.delete('.rb')
      end
    end

    def find(title)
      data = eval(File.open("db/#{title}.rb").read)
      self.new(data[:title], data[:content])
    end

    def destroy(title)
      FileUtils.rm("db/#{title}.rb")
    end
  end

  def save
    File.open("db/#{title}.rb", 'w') do |f|
      f.print "{ title: \"#{title}\", content: \"#{content}\" }"
    end
  end
end
