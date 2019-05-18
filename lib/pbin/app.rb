require_relative "version"
require_relative "pb_servlet"

module Pbin
  class App
    attr_accessor :server

    def initialize
      puts name
      puts " "*35 + VERSION

      Dir.mkdir(STORENAME) unless File.exists?("#{STORENAME}")
      @server = Server.new
    end

    def name
      <<-'EOF'
 ________  ________  ___  ________      
|\   __  \|\   __  \|\  \|\   ___  \    
\ \  \|\  \ \  \|\ /\ \  \ \  \\ \  \   
 \ \   ____\ \   __  \ \  \ \  \\ \  \  
  \ \  \___|\ \  \|\  \ \  \ \  \\ \  \ 
   \ \__\    \ \_______\ \__\ \__\\ \__\
    \|__|     \|_______|\|__|\|__| \|__|
      EOF
    end

    def start
      @server.start
    end

    def stop
      @server.stop
    end
  end
end
