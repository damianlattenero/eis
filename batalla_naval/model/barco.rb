class Barco
  
  def initialize
    @posiciones_sin_disparar = []
    @posiciones_disparadas = []
    @hundido = false
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