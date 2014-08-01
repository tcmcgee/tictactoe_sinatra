class mygame_spec.rb

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_for_echo
    get '/'
    assert last_response.ok?
    assert_equal "Echo", last_response.body
  end
end