# frozen_string_literal: true

require_relative 'plus_or_minus/version'
require 'date'

module PlusOrMinus
  module CoreExt
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
end

class Time
  include PlusOrMinus::CoreExt
end

class DateTime
  include PlusOrMinus::CoreExt
end

class Date
  include PlusOrMinus::CoreExt
end

class Numeric
  include PlusOrMinus::CoreExt
end
