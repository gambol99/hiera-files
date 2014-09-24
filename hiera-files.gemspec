#
#   Author: Rohith
#   Date: 2014-09-25 00:28:14 +0100 (Thu, 25 Sep 2014)
#
#  vim:ts=2:sw=2:et
#
$:.unshift File.join(File.dirname(__FILE__),'.','lib/hiera-files' )
require 'version'

Gem::Specification.new do |s|
    s.name        = "hiera-files"
    s.version     = HieraFiles::VERSION
    s.platform    = Gem::Platform::RUBY
    s.date        = '2014-09-25'
    s.authors     = ["Rohith Jayawardene"]
    s.email       = 'gambol99@gmail.com'
    s.homepage    = 'https://github.com/gambol99/rhiera-files'
    s.summary     = %q{Hiera Files}
    s.description = %q{Generate files from hiera data}
    s.license     = 'GPL'
    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.add_dependency 'hiera'
end
