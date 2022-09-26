class Composite::Step
  class AbstractMethodError < StandardError; end

  attr_accessor :composite, :options

  def initialize(composite, options={})
    @composite = composite
    @options   = options
  end

  def perform
    raise AbstractMethodError, "Child class must impelement method: #{method_name}"
  end

  def before_step
    composite.messages << "→ #{self.class.name} Performing..."
  end

  def after_step
    composite.messages << "→ #{self.class.name} Done."
  end
end
