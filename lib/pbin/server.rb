require 'webrick'
require_relative 'pb_servlet'

module Pbin
  class Server
    def initialize
      @server = initialize_server
      @server.mount "/", PBServerlet
    end

    def initialize_server
      server_log = WEBrick::Log.new('server.log')
      access_log_file = File.open('access.log', 'a+')

      access_log = [
        [access_log_file, WEBrick::AccessLog::COMBINED_LOG_FORMAT],
      ]

      ::WEBrick::HTTPServer.new(
        :Port => PORT,
        :Logger => server_log,
        :AccessLog => access_log
      )
    end

    def start
      @server.start
    end

    def stop
      puts "Until next time"
      @server.stop
    end
  end
end
