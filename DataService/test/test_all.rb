require 'test_helper'

class HelloTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp
  end

  def _defaults
    get '/defaults', {}, {'HTTP_ORIGIN' => 'http://localhost'}
    assert last_response.ok?
    assert_equal 'http://localhost', last_response.headers['Access-Control-Allow-Origin']
    assert_equal 'POST, GET, OPTIONS', last_response.headers['Access-Control-Allow-Methods']
    assert_equal 'true', last_response.headers['Access-Control-Allow-Credentials']
    assert_equal "1728000", last_response.headers['Access-Control-Max-Age']
  end

  def test_it_says_hello
    get '/'
    assert last_response.ok?
    assert_equal 'Hello', last_response.body
  end

end