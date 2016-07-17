#!/usr/bin/env ruby

# file: recordx_sqlite.rb

require 'sqlite3'
require 'recordx'


class RecordxSqlite

  def initialize(dbfile, table: '', primary_key: :id, pk: primary_key, 
                 sql: 'select * from ' + table)
        
    @db = SQLite3::Database.new dbfile

    @db.results_as_hash = true
    @table, @primary_key, @sql = table, pk.to_sym, sql
    @a = nil
    
  end

  def all()    
    query(@sql) unless @a
    @a
  end
  
  def find(id)
    query(@sql) unless @a
    @a.find {|x| x.method(@primary_key).call == id}
  end
  
  def query(sql=@sql)
    
    @sql = sql
    rs = @db.query sql
    
    @a = rs.map do |h| 
      h2 = h.inject({}) {|r, x| k, v = x; r.merge(k.to_sym => v)}
      RecordX.new(h2, self, h2[@primary_key]) 
    end    
    
  end  
  
  def refresh()
    query(@sql)
    'refreshed'
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

