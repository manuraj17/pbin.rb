require 'webrick'
require_relative 'slug'
require_relative 'constants'
require_relative 'ascii'

module Pbin
  class PBServerlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET(request, response)
      dirname = request.path.split('/').last
      dirpath = "#{STORENAME}/#{dirname}"

      if dirname.nil?
        response.body = Ascii.name + Ascii.version
      else
        content = File.read("#{dirpath}/index.txt")
        response.body = content
      end

      response.status = 200
      response['Content-Type'] = 'text/plain'
    end

    def do_POST(request, response)
      content = request.query["p"]
      # Try to memoize this
      slug_size = 4
      dirname = nil
      # file_name = Digest::SHA1.hexdigest(content)[0..5]
      loop do
        dirname = Slug.generate(slug_size)
        if File.exists?("#{STORENAME}/#{dirname}")
          if slug_size > 10
            response.status = 422
            response['Content-Type'] = 'text/plain'
            response.body = "Failed to create"
            break
          end
          slug_size += 1
        else
          break
        end
      end

      dirpath = "#{STORENAME}/#{dirname}"

      Dir.mkdir(dirpath)

      f = File.open("#{dirpath}/index.txt", "wb")
      f.write(content)
      f.close

      response.status = 200
      response['Content-Type'] = 'text/plain'
      response.body = dirname
    end
  end
end
