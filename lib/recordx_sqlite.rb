#!/usr/bin/env ruby

# file: recordx_sqlite.rb

require 'sqlite3'
require 'recordx'


class RecordxSqlite

  def initialize(dbfile, table: '', primary_key: :id, pk: primary_key)
    
    
    @db = SQLite3::Database.new dbfile

    @db.results_as_hash = true
    rs = @db.query 'select * from ' + table

    @table, @primary_key = table, pk.to_sym
    
    @a = rs.map do |h| 
      h2 = h.inject({}) {|r, x| k, v = x; r.merge(k.to_sym => v)}
      RecordX.new(h2, self, h2[@primary_key]) 
    end
    
  end

  def all()
    @a
  end
  
  def find(id)
    @a.find {|x| x.method(@primary_key).call == id}
  end

  def update(id, h={})

    col, value = h.to_a.first
    return if col == @primary_key

s = "
UPDATE #{@table}
SET #{col}='#{value}'
WHERE #{@primary_key.to_s}='#{id}';"

    @db.execute(s)

  end
end

