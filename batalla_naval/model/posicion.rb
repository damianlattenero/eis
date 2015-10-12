class Posicion
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def posicion
    "#{@x},#{@y}"
  end

end