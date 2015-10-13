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

  def ubicar_barco_en posiciones_que_ocupara
    @posiciones_sin_disparar.concat posiciones_que_ocupara
  end

  def posiciones_a_ocupar posicion, direccion = nil
    pos = posicion
    result = []
    @largo.times do |n|
      result << pos
      if direccion == "horizontal"
        pos = Posicion.new(pos.x + 1, pos.y)
      elsif direccion == "vertical"
        pos = Posicion.new(pos.x, pos.y+1)
      end
    end
    result
  end

  def disparar_en posicion
    @posiciones_sin_disparar.delete posicion
    @posiciones_disparadas << posicion

    if @posiciones_sin_disparar.empty?
      Hundido
    else
      Tocado
    end
  end
end

class Submarino < Barco

  def initialize
    super
    @largo = 1
  end

  def ubicar_barco_en posicion
    super
  end
end

class Crucero < Barco

  def initialize
    super
    @largo = 2
  end


  def ubicar_barco_en posicion
    super
  end
end

class Acorazado < Barco
  def initialize
    super
    @largo = 3
  end


  def ubicar_barco_en posicion
    super
  end
end