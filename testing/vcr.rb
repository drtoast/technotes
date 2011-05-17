# https://github.com/myronmarston/vcr
# Uses stubbing via FakeWeb or WebMock

require 'rubygems'
require 'test/unit'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.stub_with :webmock # or :fakeweb
end

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette('synopsis') do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/example/'))
      assert_match /Example Domains/, response.body
    end
  end
end
# Run this test once, and VCR will record the http request to fixtures/vcr_cassettes/synopsis.yml. Run it again, and VCR will replay the response from iana.org when the http request is made. This test is now fast (no real HTTP requests are made anymore), deterministic (the test will continue to pass, even if you are offline, or iana.org goes down for maintenance) and accurate (the response will contain the same headers and body you get from a real request).