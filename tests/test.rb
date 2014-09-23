#!/usr/bin/env ruby
#
#   Author: Rohith
#   Date: 2014-09-23 00:16:47 +0100 (Tue, 23 Sep 2014)
#
#  vim:ts=4:sw=4:et
#
$:.unshift File.join(File.dirname(__FILE__),'.','../lib')
require 'hiera-files'

Options = {
  :hiera     => './data'
}

files = HieraFiles.new( Options )
puts files.render 'config.conf.erb', {}



