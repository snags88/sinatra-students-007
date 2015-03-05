class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
end