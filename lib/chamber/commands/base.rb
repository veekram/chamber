require 'chamber/commands/context_resolver'
require 'chamber/instance'

module  Chamber
module  Commands
class   Base

  def initialize(options = {})
    options       = ContextResolver.resolve(options)

    self.chamber  = Chamber::Instance.new options
    self.shell    = options[:shell]
    self.rootpath = options[:rootpath]
    self.dry_run  = options[:dry_run]
  end

  def self.call(options = {})
    self.new(options).call
  end

  protected

  attr_accessor :chamber,
                :shell,
                :dry_run
  attr_reader   :rootpath

  def rootpath=(other)
    @rootpath ||= Pathname.new(other)
  end
end
end
end