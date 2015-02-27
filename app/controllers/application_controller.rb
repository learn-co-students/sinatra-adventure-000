class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  set :sessions, true
  set :session_secret, "My session secret"

  configure :development do
    register Sinatra::Reloader
  end

end
