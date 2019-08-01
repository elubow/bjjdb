RSpec::Matchers.define :be_a_similar_url_to do |expected|
  match do |actual|
    expected_uri = URI.parse(expected)
    actual_uri = URI.parse(actual)

    expect(actual_uri.host).to eql(expected_uri.host)
    expect(actual_uri.port).to eql(expected_uri.port)
    expect(actual_uri.scheme).to eql(expected_uri.scheme)
    expect(Rack::Utils.parse_nested_query(actual_uri.query)).to eql(Rack::Utils.parse_nested_query(expected_uri.query))
    expect(actual_uri.fragment).to eql(expected_uri.fragment)
  end

  # optional
  failure_message do |actual|
    "expected that #{actual} would be a similar URL to #{expected}"
  end

  # optional
  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a similar URL to #{expected}"
  end
end
