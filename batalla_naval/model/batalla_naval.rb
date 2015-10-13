require_relative "failable"

class BatallaNaval

  def initialize
    @tablero = []
    @dimension_x = 20
    @dimension_y = 20
  end

  def ubicar_barco_en x,y, tipo_barco, direccion = nil
    barco = Barco.create(tipo_barco)
    pos = Posicion.new(x,y)
    posiciones_que_ocupara = barco.posiciones_a_ocupar(pos, direccion)
    
    self.verificar_posiciones_en_dimensiones_del_tablero(posiciones_que_ocupara)
    
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
  
  def verificar_posiciones_en_dimensiones_del_tablero posiciones_que_ocupara
    cayo_fuera = posiciones_que_ocupara.inject(false) { |result, posicion|
      self.cae_fuera_del_tablero?(posicion) || result
    }

    if cayo_fuera
      raise FueraDelTableroExcepcion
    end
  end

  def cae_fuera_del_tablero? posicion
    posicion.x > @dimension_x || posicion.x < 0 ||
        posicion.y > @dimension_y || posicion.y < 0
  end

  def disparar_en x, y
    Agua
  end
end

class FueraDelTableroExcepcion < Exception
  def message
    'No se puede ubicar un barco fuera de las dimensiones del tablero'
  end
end


class Agua
end

class Tocado
end

class Hundido
end