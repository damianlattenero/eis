class Barco
  
  def initialize
    @posiciones_sin_disparar = []
    @posiciones_disparadas = []
    @largo
    @hundido = false
  end

  def self.create tipo_barco
    case tipo_barco
      when "submarino" then Submarino.new
      when "crucero" then Crucero.new
      when "acorazado" then Acorazado.new
    end
  end

  def tiene_posicion? posicion
    @posiciones_sin_disparar.include?(posicion)
  end

  def ubicar_barco_en posicion, direccion = nil
    posiciones = self.posiciones_a_ocupar posicion, direccion
    @posiciones_sin_disparar.concat posiciones
  end

  def posiciones_a_ocupar posicion, direccion = nil
    pos = posicion
    result = []
    @largo.times do |n|
      result << pos
      if direccion == "horizontal"
        pos = Posicion.new(pos.x + 1, pos.y)
      else
        pos = Posicion.new(pos.x, pos.y+1)
      end
    end
    result
  end
end

class Submarino < Barco

  def initialize
    super
    @largo = 1
  end

  def ubicar_barco_en posicion, direccion = nil
    super
  end
end

class Crucero < Barco

  def initialize
    super
    @largo = 2
  end


  def ubicar_barco_en posicion, direccion = nil
    super
  end
end

class Acorazado < Barco
  def initialize
    super
    @largo = 3
  end


  def ubicar_barco_en posicion, direccion = nil
    super
  end
end