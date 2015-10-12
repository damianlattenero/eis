class Posicion
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def ==(pos)
    pos.state == self.state
  end

  def state
    self.instance_variables.map { |variable| self.instance_variable_get variable }
  end
end