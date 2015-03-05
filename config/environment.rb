require 'bundler/setup'
Bundler.require(:default)

configure :development do
  ENV['SINATRA_ENV'] ||= "development"
  Bundler.require(ENV['SINATRA_ENV'])
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
  Bundler.require(:production)
  ENV['DATABASE_URL'] = "postgres://svmphxasdepskl:9CFMIbfBAAUSF3D8lXB9Ph19OG@ec2-50-19-249-214.compute-1.amazonaws.com:5432/d6um3v6k5ksqsp"
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



