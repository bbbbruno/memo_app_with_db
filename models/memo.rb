# frozen_string_literal: true

require 'fileutils'
require 'pg'

class Memo
  SETTINGS = { host: 'localhost', user: 'postgres', dbname: 'postgres', port: '5432' }

  attr_accessor :id, :title, :content, :created_at, :updated_at

  def initialize(id: '', title:, content: '', created_at: '', updated_at: '')
    @id = id
    @title = title
    @content = content.gsub(/\R/, "\n")
    @created_at = created_at
    @updated_at = updated_at
  end

  class << self
    def symbolize_keys(hash)
      hash.map { |k, v| [k.to_sym, v] }.to_h
    end

    def exec(q, a = [])
      connection = PG.connect(SETTINGS)
      connection.exec(q, a)
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end

    def all
      exec('SELECT * FROM memos;').each.with_object([]) do |h, a|
        a << new(symbolize_keys(h))
      end
    end

    def find(id)
      result = exec('SELECT * FROM memos WHERE id = $1', [id])
      new(symbolize_keys(result.first))
    end

    def destroy(id)
      exec('DELETE FROM memos WHERE id = $1', [id])
    end
  end

  def save
    Memo.exec(
      'INSERT INTO memos (title, content, created_at, updated_at) VALUES ($1, $2, $3, $4);',
      [title, content, Time.now, Time.now],
    )
  end

  def update
    Memo.exec(
      'UPDATE memos SET title = $1, content = $2, updated_at = $3 WHERE id = $4;',
      [title, content, Time.now, id],
    )
  end
end
