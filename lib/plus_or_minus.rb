# frozen_string_literal: true

require_relative "plus_or_minus/version"
require "date"

module PlusOrMinus
  class Error < StandardError; end

  module InstanceMethods
    def plus_or_minus(span)
      (self - span)..(self + span)
    end

    def plus_upto(span)
      self..(self + span)
    end

    def minus_upto(span)
      (self - span)..self
    end
  end

  refine Time do
    import_methods InstanceMethods
  end

  refine DateTime do
    import_methods InstanceMethods
  end

  refine Numeric do
    import_methods InstanceMethods
  end
end
