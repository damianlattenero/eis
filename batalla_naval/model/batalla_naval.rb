require_relative "failable"

class BatallaNaval

  def initialize
    @tablero = []
  end

  def ubicar_barco_en x,y, tipo_barco, direccion = nil
    barco = Barco.create(tipo_barco)
    barco.ubicar_barco_en(Posicion.new(x,y),direccion)
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