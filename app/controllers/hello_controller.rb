require_relative './application_controller'

class HelloController < ApplicationController

  get '/xyzzy' do
    erb :hello
  end

end
