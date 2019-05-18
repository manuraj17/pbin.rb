require 'securerandom'
require 'digest/sha1'

module Pbin
  class Slug
    SEED = Array('A'..'Z') + Array('a'..'z') + Array(0..9)

    def self.generate(size)
      SEED.sample(size, random: SecureRandom).join
    end
  end
end
