#
#   Author: Rohith
#   Date: 2014-09-23 00:36:21 +0100 (Tue, 23 Sep 2014)
#
#  vim:ts=2:sw=2:et
#
module HieraFiles
  class Render
    attr_accessor :filename, :scope, :hiera

    def initialize
      @hiera    = nil
      @filename = nil
      @scope    = nil
      yield self if block_given?
    end

    def print
      ERB.new( File.read(filename), nil, '-' ).result( binding )
    end

    protected
    def lookup key, default = nil
      hiera.lookup( key, default, scope, nil, nil)
    end

    def array key, default = nil
      hiera.lookup( key, default, scope, nil, :array)
    end

    def hash key, default = nil
      hiera.lookup( key, default, scope, nil, :hash)
    end

    alias_method :h, :hash
    alias_method :x, :lookup
    alias_method :l, :lookup
    alias_method :a, :array
  end
end
