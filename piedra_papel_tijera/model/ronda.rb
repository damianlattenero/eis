class Ronda

  def initialize jugador1, jugador2
    @jugador1 = jugador1
    @jugador2 = jugador2
  end

  def jugar elem1, elem2
    res = elem1.new.juega_con elem2
    if res == Gano
      @jugador1.victorias += 1
    else
      puts res.to_s
      @jugador2.victorias +=1
    end

  end
end