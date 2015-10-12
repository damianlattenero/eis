class Barco
  
  def initialize
    @posiciones_sin_disparar = []
    @posiciones_disparadas = []
    @hundido = false
  end

  def self.create tipo_barco
    case tipo_barco
      when "submarino" then Submarino.new
      when "crucero" then Crucero.new
      when "acorazado" then Acorazado.new
    end
  end
  
  def ubicar_barco_en posicion, direccion = nil
    raise "undefined method"
  end

  def tiene_posicion? posicion
    @posiciones_sin_disparar.include?(posicion)
  end
end

class Submarino < Barco

  def ubicar_barco_en posicion, direccion = nil
    @posiciones_sin_disparar << posicion
  end

end


class Crucero < Barco

end

class Acorazado < Barco

end