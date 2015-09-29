class Elemento
  @gana_con
  @empata_con

  def juega_con otro_elemento
    if @gana_con.member?(otro_elemento)
      Gano
    elsif @empata_con.member?(otro_elemento)
      Empato
    else
      Perdio
    end

  end

end

class Piedra < Elemento
  def initialize()
    @gana_con = [Tijera]
    @empata_con = [Piedra, Mono]
  end

end

class Papel < Elemento
  def initialize()
    @gana_con = [Piedra]
    @empata_con = [Papel]

  end

end

class Tijera < Elemento
  def initialize()
    @gana_con = [Papel, Mono]
    @empata_con = [Tijera]

  end

end

class Mono < Elemento
  def initialize()
    @gana_con = [Papel]
    @empata_con = [Piedra, Mono]

  end

end