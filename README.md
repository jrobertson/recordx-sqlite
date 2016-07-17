# Introducing the RecordX-SQLite gem

## Example

    require 'recordx_sqlite'

    rs = RecordxSqlite.new('/tmp/headers2.db', table: 'headers')
    r = rs.all.first
    r.fruit =  'apple'

The above example updates the column *fruit* in the 1st record of the database with the value *apple*.

Notes:

* The database, table, and records must exist
* Whenever an attribute is updated it updates the corresponding database record automatically
* The unique primary key must be called *id* for the record update to work.

## Resources

* recordx_sqlite https://rubygems.org/gems/recordx_sqlite

recordx sqlite sqlite3 orm recordx_sqlite
