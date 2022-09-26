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
      before_process

      steps.each do |step|
        step.before_perform
        step.perform
        step.after_perform
      end

      after_process
    end

    def before_process
      # optional
    end

    def after_process
      # optional
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
      raise AbstractMethodError,
        "Child class must impelement abstract method: #{method_name}"
    end

    def before_perform
      # Optional
    end

    def after_perform
      # Optional
    end
  end
end
