require_relative "failable"

class BatallaNaval

  def initialize
    @tablero = []
  end

  def ubicar_barco_en posicion, barco, direccion = nil
    barco.ubicar_barco_en(posicion,direccion)
    @tablero << barco
    Failable.success 'barco colocado exitosamente'
  end

  def hay_barco_en? posicion
    @tablero.inject(false) { |result, barco|
      barco.tiene_posicion?(posicion) || result
    }
  end

end

class Horizontal
end

class Vertical
end