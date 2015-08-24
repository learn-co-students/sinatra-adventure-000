class RegistrationsController < ApplicationController

  get '/register' do
    erb :register
  end

  post "/register" do
    session[:info] = [params[:name], params[:email]]
    redirect "/new"
  end
  # Registration!
  # You'll need a way to send the registration form here.
  # Use your battle-hardened text editor to create the
  # appropriate route, look at the request, and then
  # direct them to the new user page via the /new route.

  ##### TODO: Create a route that handles a POST HTTP request from the
  ##### registration form, then see what /new has to say.

  # Note: you aren't creating persistence for a user. This
  # is a very dumb, single-request registration process.
  # It is the wise adventurer that doesn't overthink the task!

  get '/new' do
    redirect '/register' unless user_registered?
    @email = session[:info][1]
    # keep this line of code in place to protect this sacred
    # page from interlopers who have not properly completed
    # the maze you are constructing. You will need to implement
    # the code to allow them to pass this challenge when
    # they have registered


    # You will need to send properly registered people to me
    # and render a template that will tell them they
    # have completed their quest
    erb :new_user
    # TODO: render the new user template and see what it says.
  end
  # Bonus experience! The throw above makes an ugly error page happen.
  # Can you check for the same condition, but send them back to
  # the registration page with an error message that will tell
  # them what they've done wrong?

  def user_registered?
    if session[:info]
      return true
    end
    false
  end

end
