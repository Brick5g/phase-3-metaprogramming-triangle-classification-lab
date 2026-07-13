class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    raise TriangleError, "invalid triangle" unless valid_triangle?

    case @sides.uniq.length
    when 1
      :equilateral
    when 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

  private

  def valid_triangle?
    return false if @sides.any? { |side| side <= 0 }

    a, b, c = @sides.sort
    a + b > c
  end
end
