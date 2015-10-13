require_relative "failable"

class BatallaNaval

  def initialize
    @tablero = []
  end

  def ubicar_barco_en x,y, tipo_barco, direccion = nil
    barco = Barco.create(tipo_barco)
    pos = Posicion.new(x,y)
    posiciones_que_ocupara = barco.posiciones_a_ocupar(pos, direccion)
    if self.hay_barco_desde?(posiciones_que_ocupara)
      Failable.failure 'ya hay un barco en esa posicion'
    else
      barco.ubicar_barco_en(posiciones_que_ocupara)
      @tablero << barco
      Failable.success 'barco colocado exitosamente'
    end

  end

  def hay_barco_en? posicion
    @tablero.inject(false) { |result, barco|
      barco.tiene_posicion?(posicion) || result
    }
  end

  def hay_barco_desde? posiciones_que_ocupara
    posiciones_que_ocupara.inject(false) { |result, posicion|
      self.hay_barco_en?(posicion) || result
    }
  end
end
