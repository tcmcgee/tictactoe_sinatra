require './lib/presenters/option_presenter'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'OptionPresenter' do
	it "can generate options" do
		options = {"Board Size" => ['3x3','4x4'],
					"Player1" => ['Player', 'Computer'],
					"Player2" => ['Player', 'Computer']}

		result = OptionPresenter.make_options(options)

		result.should include ('form')
		result.should include ('Board Size')
		result.should include ('Player1')
		result.should include ('Player2')
	end
end