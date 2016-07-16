#!/usr/bin/env ruby

# file: recordx_sqlite.rb

require 'sqlite3'
require 'recordx'


class RecordxSqlite

  def initialize(dbfile, table)

    @db = SQLite3::Database.new dbfile
    @db.results_as_hash = true
    rs = @db.query 'select * from ' + table

    @a = rs.map do |h| 
      h2 = h.inject({}) {|r, x| k, v = x; r.merge(k.to_sym => v)}
      RecordX.new(h2, self, h2[:uid]) 
    end
    
    @table = table

  end

  def all()
    @a
  end

  def update(id, h={})

    col, value = h.to_a.first
    return if col == :id

s = "
UPDATE #{@table}
SET #{col}='#{value}'
WHERE id='#{id}';"

    @db.execute(s)

  end
end
