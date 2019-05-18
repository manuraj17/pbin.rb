require_relative 'constants'

module Pbin
  class Logger
    INFO_PREFIX       = '[>]'
    WARNING_PREFIX    = '[!]'
    ERROR_PREFIX      = '[x]'

    def initialize
      puts "#{now} Logging to #{LOGFILE}"
      @log = File.open(LOGFILE, 'ab')
    end

    def now
      "#{Time.now.strftime("[%Y-%m-%d %H:%M:%S]")}"
    end

    def info(text)
      "#{now} #{INFO_PREFIX} #{text}"
    end

    def warning(text)
      "#{now} #{WARNING_PREFIX} #{error}"
    end

    def error(text)
      "#{now} #{ERROR_PREFIX} #{error}"
    end
  end
end
