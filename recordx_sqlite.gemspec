Gem::Specification.new do |s|
  s.name = 'recordx_sqlite'
  s.version = '0.1.1'
  s.summary = 'RecordX-SQLite is an object relational mapper primarily designed for updating records in bulk.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/recordx_sqlite.rb']
  s.add_runtime_dependency('sqlite3', '~> 1.3', '>=1.3.11')
  s.add_runtime_dependency('recordx', '~> 0.4', '>=0.4.0')
  s.signing_key = '../privatekeys/recordx_sqlite.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/recordx_sqlite'
end
