require 'sinatra'
require './lib/presenters/ttt_option_presenter'

set :public_folder, 'public'

get '/hello_world' do
  redirect 'images/twitter.gif'
end