require_relative "failable"

class BatallaNaval

  def initialize
    @posiciones = {}
  end

  def ubicar_barco_en posicion, barco, direccion = nil
    @posiciones[posicion.posicion] = barco
    Failable.success 'barco colocado exitosamente'
  end

end

class Horizontal
end

class Vertical
end