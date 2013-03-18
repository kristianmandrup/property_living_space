class Integer
  def to_sqfeet
    (self * 10.764).round
  end

  def to_sqm
    (self.to_f / 10.764).round
  end
end

class Range
  def covers? range
    case range
    when Fixnum
      cover? range
    when Range
      cover?(range.min) && cover?(range.max)
    else
      raise ArgumentError, "Must be Fixnum or Range, was: #{range}"
    end
  end

  def to_sqfeet
    Range.new min.to_sqfeet, max.to_sqfeet
  end

  def to_sqm
    Range.new min.to_sqm, max.to_sqm
  end

  def span
    max - min
  end
end

class Array
  def to_sqfeet!
    self.map!{|n| n.to_sqfeet }
  end

  def to_sqm!
    self.map!{|n| n.to_sqm }
  end

  def to_sqfeet
    self.map{|n| n.to_sqfeet }
  end

  def to_sqm
    self.map{|n| n.to_sqm }
  end
end  

class Unit
  def self.to_sqfeet number
    (number * 10.764).round
  end

  def self.to_sqm number
    (number.to_f / 10.764).round
  end
end