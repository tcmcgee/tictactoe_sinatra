require 'sinatra'
require 'sinatra/contrib'
require 'rack/test'
require './mygame'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'my game' do
  describe '/' do
    it "returns a 200" do
      get '/'
      last_response.status.should == 200
    end
  end

  describe '/hello_world' do
    it "returns a 200" do
      get '/hello_world'
      last_response.status.should == 200
    end
  end

  describe '/game' do
    it "returns a 200" do
      post '/game'
      last_response.status.should == 200
    end
  end
end
