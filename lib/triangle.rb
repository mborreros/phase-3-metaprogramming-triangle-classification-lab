require "pry"

class Triangle

  attr_accessor :length1, :length2, :length3, :type
  
  def initialize(length1, length2, length3)
      @length1 = length1
      @length2 = length2
      @length3 = length3
      @type = "unknown"
  end

  def kind
    sides = [@length1, @length2, @length3]

    # binding.pry

    if sides.include? 0
      begin
        raise TriangleError
      end
    elsif sides.select(&:negative?).count > 0
      begin
        raise TriangleError
      end
    elsif self.length1 + self.length2 <= self.length3
      begin
        raise TriangleError
      end
    elsif self.length2 + self.length3 <= self.length1
      begin
        raise TriangleError
      end
    elsif self.length1 + self.length3 <= self.length2
      begin
        raise TriangleError
      end
    else
      if sides.uniq.count == 1
        self.type = :equilateral
      elsif sides.uniq.count == 2
        self.type = :isosceles
      else 
        self.type = :scalene
      end
      self.type
    end
  end

  class TriangleError < StandardError
    puts "this is not a triangle!"
  end

end
