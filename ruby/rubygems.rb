=begin
Creating a gem using Hoe

http://seattlerb.rubyforge.org/hoe/
http://drnicwilliams.com/2009/11/04/hacking-someones-gem-with-github-and-gemcutter/
1. Make sure your project uses this layout:


project_dir/
  History.txt
  Manifest.txt
  README.txt
  Rakefile
  bin/...
  lib/...
  test/...
=end

# 2. edit Rakefile

require 'rubygems'
require 'hoe'

$:.unshift("./lib/")
require 'mp3info'

Hoe.new('ruby-mp3info', Mp3Info::VERSION) do |p|
  p.rubyforge_name = 'ruby-mp3info'
  p.author = "Guillaume Pierronnet"
  p.email = "moumar@rubyforge.org"
  p.summary = "ruby-mp3info is a pure-ruby library to retrieve low level informations on mp3 files and manipulate id3v1 and id3v2 tags"
  p.description = p.paragraphs_of('README.rdoc', 5..9).join("\n\n")
  p.url = p.paragraphs_of('README.rdoc', 0).first.split(/\n/)[1..-1]
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.remote_rdoc_dir = ''
  p.rdoc_locations << "rubyforge.org:/var/www/gforge-projects/ruby-mp3info/"
end
