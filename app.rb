require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/core_ext/object'
require_relative 'lib/authentication'
require_relative 'lib/user'

TEN_MINUTES   = 60 * 10
use Rack::Session::Pool, expire_after: TEN_MINUTES # Expire sessions after ten minutes of inactivity
helpers Authentication

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
  
  def redirect_to_original_request
    user = session[:user]
    flash[:notice] = "Welcome back #{user.name}."
    original_request = session[:original_request]
    session[:original_request] = nil
    redirect original_request
  end
end

before do
  headers 'Content-Type' => 'text/html; charset=utf-8'
end

get '/signin/?' do
  erb :signin, locals: { title: 'Sign In' }
end

post '/signin/?' do
  if user = User.authenticate(params)
    session[:user] = user
    redirect_to_original_request
  else
    flash[:notice] = 'You could not be signed in. Did you enter the correct username and password?'
    redirect '/signin'
  end
end

get '/signout' do
  session[:user] = nil
  flash[:notice] = 'You have been signed out.'
  redirect '/'
end

get '/?' do
  erb :index, locals: { title: 'Home' }
end

get '/protected/?' do
  authenticate!
  erb :protected, locals: { title: 'Protected Page' }
end
