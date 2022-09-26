# frozen_string_literal: true

module Lokap
  class Composite
    attr_accessor :steps, :messages

    def initialize(options={steps: []})
      @steps    = options[:steps]
      @messages = []
    end

    def steps
      @steps ||= []
    end

    def add_step(step)
      steps << step.new(self)
    end

    def add_steps(steps=[])
      [steps].flatten.compact.each { |step| add_step(step) }
    end

    def process
      before_all

      steps.each do |step|
        before_each

        step.before_step
        step.perform
        step.after_step

        after_each
      end

      after_all; self
    end

    def before_each
      # noop
    end

    def after_each
      # noop
    end

    def before_all
      messages << "#{self.class.name} Processing..."
    end

    def after_all
      messages << "#{self.class.name} Done."
    end
  end

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
end
