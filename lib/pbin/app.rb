require_relative "ascii"
require_relative "pb_servlet"

module Pbin
  class App
    attr_accessor :server

    def initialize
      puts Ascii.name
      puts Ascii.version

      Dir.mkdir(STORENAME) unless File.exists?("#{STORENAME}")
      @server = Server.new
    end

    def start
      @server.start
    end

    def stop
      @server.stop
    end
  end
end
