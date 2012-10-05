### http://nokogiri.org/

require 'nokogiri'

# Get a Nokogiri::HTML:Document for the page we’re interested in...
require 'open-uri'
@doc = Nokogiri::HTML(open('http://www.google.com/search?q=tenderlove'))

# SEARCH for nodes by css
@doc.css('h3.r a.l').each do |link|
  puts link.content
end

# SEARCH for nodes by css, returning an array of matching nodes
@doc = Nokogiri.XML('<foo><bar baz="blah">huzzah</baz><foo>')
@doc.css('foo bar[baz=blah]').each do |e|
  puts e.content
end
# => "huzzah"

# SEARCH shortcut: get the first matching node
@doc.at_css('foo bar[baz=blah]').content
# => "huzzah"

# CHANGING content
@doc.at_css('foo bar[baz=blah]').content = "boo-yaa"
@doc.to_xml
# => "<?xml version=\"1.0\"?>\n<foo>\n  <bar baz=\"blah\">boo-yaa</bar>\n  <foo/>\n</foo>\n"

# CHANGING names and attributes
h1 = @doc.at_css 'h1'
h1.name = 'h2'
h1['class'] = 'show-title'

# MOVING nodes
h1  = @doc.at_css "h1"
div = @doc.at_css "div"
h1.parent = div
