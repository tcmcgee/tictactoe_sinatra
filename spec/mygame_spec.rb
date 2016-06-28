require 'sinatra'
require 'sinatra/contrib'
require 'rack/test'
require_relative '../mygame.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'mygame' do
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

  describe '/move' do
    it 'can turn a - into an array of nil' do
      app.string_board_to_array('---------').should == (Array.new(9,nil))
    end

    it 'can turn a O into an array of "X"' do
      app.string_board_to_array('XXXXXXXXX').should == (Array.new(9,'X'))
    end

    it 'can turn a O into an array of "O"' do
      app.string_board_to_array('OOOOOOOOO').should == (Array.new(9,'O'))
    end

    it 'can make a board out of a mix of Xs Os and nils' do
      app.string_board_to_array('XO-XO-XX-').should == (['X','O',nil,'X','O',nil,'X','X',nil])
    end
  end
end
