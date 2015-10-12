class Failable
  attr_reader :success

  def initialize(value, success)
    @value   = value
    @success = success
  end

  def to_s
    if @success
      "Success #{@value}"
    else
      "Failure #{@value}"
    end
  end


  def self.success(val)
    Failable.new(val, true)
  end

  def self.failure(val)
    Failable.new(val, false)
  end
end
