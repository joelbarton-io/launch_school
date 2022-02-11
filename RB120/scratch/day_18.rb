require 'pry'

module Athlete
  class Strength
    module WillPower
      class Mantra
        def say
          puts "I'm an instance method inside of: #{self.class}"
        end
      end
    end
  end
end

# Athlete::Strength::WillPower::Mantra.new.say

class Klass

	def greet
		p self       #self : instance that calls the instance method
	end

	def self.greet
		p self       #self : class that calls class method
	end
end

class QueueThang
  attr_reader :arr
  def initialize(arr)
    @arr = arr
  end

  def to_s
    p arr.join(', ').class
  end
end

#puts QueueThang.new([1, 2, 3, 4, 5])

module SomeMod
  CONSTANT_HUH = 'YUH'
end

class Coffee
  include SomeMod

  def taste_like
    puts CONSTANT_HUH
  end
end

Coffee.new.taste_like