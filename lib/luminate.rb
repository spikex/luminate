require 'luminate/version'
require 'luminate/config'
require 'luminate/base'

module Luminate

  autoload :Donation,    'luminate/donation'
  autoload :Constituent, 'luminate/constituent'

  class << self
    attr_accessor :config
  end

  self.config ||= Config.new

  def self.configure
    yield config
    config
  end
end
