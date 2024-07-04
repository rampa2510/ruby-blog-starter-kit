if Rails.env.development? || Rails.env.test?
  ActiveRecord::Base.connection.execute('PRAGMA synchronous = NORMAL')
  ActiveRecord::Base.connection.execute('PRAGMA journal_mode = WAL')
end
