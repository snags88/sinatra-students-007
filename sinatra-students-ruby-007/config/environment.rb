require 'bundler/setup'

configure :development do
  ENV['SINATRA_ENV'] ||= "development"
  Bundler.require(:default, ENV['SINATRA_ENV'])
  set :database, 'sqlite:///dev.db'
  set :show_exceptions, true

  require_all 'app'

  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
  require_all 'app'

  ENV['DATABASE_URL'] = "postgres://lczwxjjhixpfmn:2uaK3d6aye7UFR_sKTtrKs52QA@ec2-50-19-249-214.compute-1.amazonaws.com:5432/d39i70q4p7k6uq"
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
  ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end



