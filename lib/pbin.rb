require_relative "pbin/version"
require_relative "pbin/logger"
require_relative "pbin/server"
require_relative "pbin/constants"
require_relative "pbin/app"

module Pbin
  class Error < StandardError; end

  def self.run
    app = App.new

    trap('INT') {
      app.stop
    }

    app.start
  end
end
