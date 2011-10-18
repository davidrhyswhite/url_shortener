require 'active_record'
namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Base.establish_connection(
      :adapter  => 'sqlite3',
      :database =>  'db/application.sqlite3'
    )
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end