#
#   Author: Rohith
#   Date: 2014-09-23 00:17:26 +0100 (Tue, 23 Sep 2014)
#
#  vim:ts=2:sw=2:et
#
$:.unshift File.join(File.dirname(__FILE__),'.','./')
require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'utils'
require 'render'
require 'config'

module HieraFiles
  class Templater
    include HieraFiles::FileUtils
    include HieraFiles::Config

    def initialize configuration
      validate_options( options( configuration ) )
    end

    def render path, scope = {}
      HieraFiles::Render.new { |x|
        x.hiera    = hiera
        x.filename = validate_file( path )
        x.scope    = scope
      }.print
    end

    private
    def hiera
      @hiera ||= Hiera.new( :config => options[:configuration] )
    end

    def options set_default_options = {}
      @options ||= set_default_options
    end

    def validate_options options
      # step: validate the configuration file
      validate_file options[:config] if options[:config]
      # step: load either the default configuation or the config file
      options[:configuration] = YAML.load( ( options[:config] ) ? File.read(options[:config]) : Default_Configuration )
      # step: allow for overrides for yaml backends only
      if options[:directory]
        configuration = options[:configuration]
        raise ArgumentError, "we can only override yaml backends" unless configuration[:backends].include? 'yaml'
        configuration[:yaml] ||= {}
        configuration[:yaml][:datadir] = options[:directory]
      end
      options
    end
  end
end
