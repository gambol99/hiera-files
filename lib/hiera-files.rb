#
#   Author: Rohith
#   Date: 2014-09-23 00:17:08 +0100 (Tue, 23 Sep 2014)
#
#  vim:ts=2:sw=2:et
#
require 'hiera'
require 'erb'

module HieraFiles
  ROOT = File.expand_path File.dirname __FILE__
  require "#{ROOT}/hiera-files/version"

  autoload :Templater,  "#{ROOT}/hiera-files/templater"
  autoload :Utils,      "#{ROOT}/hiera-files/utils"

  def self.version
    HieraFiles::VERSION
  end

  def self.new options
    HieraFiles::Templater.new options
  end
end
