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

module HieraFiles
  class Templater
    include HieraFiles::FileUtils

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
      @hiera ||= Hiera.new( :config => default_hiera_config )
    end

    def options set_default_options = {}
      @option ||= set_default_options
    end

    def default_hiera_config
      @configuration ||= nil
      unless @configuration
        @configuration = {
          :backends       => [ 'yaml' ],
          :logger         => 'noop',
          :hierarchy      => options[:hierarchy] || [ 'common' ],
          :yaml           => {
            :datadir => options[:hiera]
          }
        }
        @configuration[:merge_behavior] = ( Gem::Specification::find_all_by_name('deep_merge').any? ) ? :deep_merge : :native
      end
      @configuration
    end

    def validate_options options
      # step: check we have a hiera data directory
      raise ArgumentError, "you have not specified the hiera data directory" unless options[:hiera]
      # step: check its a directory and readable
      validate_directory options[:hiera]
      options
    end
  end
end
