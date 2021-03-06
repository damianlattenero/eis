require 'rspec'
require_relative '../model/batalla_naval'
require_relative '../model/barco'
require_relative '../model/posicion'


describe 'ubicacion de submarino exitosa' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo submarino en 1,1 deberia aparecer en la posicion 1,1 del tablero' do
    @posicion = Posicion.new(1,1)
    @fallo = batalla_naval.ubicar_barco_en(1,1, "submarino")
    expect(batalla_naval.hay_barco_en?(Posicion.new(1,1))).to be_truthy
    expect(@fallo.to_s).to eq "Success barco colocado exitosamente"
  end


end

describe 'ubicacion de submarino fallida' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo submarino en 1,1 deberia aparecer en la posicion 1,1 del tablero' do
    @posicion = Posicion.new(1,1)
    @fallo = batalla_naval.ubicar_barco_en(1,1, "submarino")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
    expect(@fallo.to_s).to eq "Success barco colocado exitosamente"

    @fallo = batalla_naval.ubicar_barco_en(1,1, "submarino")

    expect(@fallo.to_s).to eq "Failure ya hay un barco en esa posicion"
  end


end

describe 'ubicacion de crucero' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo crucero en 1,1 horizontal deberia aparecer en la posicion 1,1 y 2,1 del tablero' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1,1, "crucero", "horizontal")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(2,1))).to be_truthy
  end

  it 'cuando coloco un barco tipo crucero en 1,1 vertical deberia aparecer en la posicion 1,1 y 1,2 del tablero' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1,1, "crucero", "vertical")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(1,2))).to be_truthy
  end


end

describe 'ubicacion de crucero fallida' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo crucero en 1,1 horizontal y hay un submarino en la posicion 1,1 no puedo colocarlo' do
    @posicion = Posicion.new(1,1)
    @fallo = batalla_naval.ubicar_barco_en(1, 1, "submarino", "horizontal")
    @fallo = batalla_naval.ubicar_barco_en(1, 1, "crucero", "horizontal")
    expect(@fallo.to_s).to eq "Failure ya hay un barco en esa posicion"


  end

  it 'cuando coloco un barco tipo crucero en 1,1 vertical y hay un submarino en la posicion 1,2 no puedo colocarlo' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1, 2, "submarino", "horizontal")
    @fallo = batalla_naval.ubicar_barco_en(1,1, "crucero", "vertical")
    expect(@fallo.to_s).to eq "Failure ya hay un barco en esa posicion"

  end


end

describe 'ubicacion de acorazado' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo acorazado en 1,1 horizontal deberia aparecer en la posicion 1,1 y 2,1 3,1 del tablero' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1,1, "acorazado", "horizontal")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(2,1))).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(3,1))).to be_truthy

  end

  it 'cuando coloco un barco tipo acorazado en 1,1 horizontal deberia aparecer en la posicion 1,1 y 2,1 3,1 del tablero' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1,1, "acorazado", "vertical")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(1,2))).to be_truthy
    expect(batalla_naval.hay_barco_en?(Posicion.new(1,3))).to be_truthy

  end
end

describe 'ubicacion de submarino fuera del tablero' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo submarino en 1,21 en un tablero de 20,20 no lo puedo colocar' do
    begin
      batalla_naval.ubicar_barco_en(1,21, "submarino")
    rescue FueraDelTableroExcepcion => e
      @excepcion = e
    end

    expect(@excepcion.message).to eq 'No se puede ubicar un barco fuera de las dimensiones del tablero'
  end


end

describe 'disparo y no hay barco' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'en un juego sin barcos si disparo en la posicion 1,1 toco agua' do
    @resultado = batalla_naval.disparar_en(1,1)
    expect(@resultado).to eq Agua
  end


end

describe 'disparo y hay barco' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando disparo en 1,1 y hay un crucero en 1,1 y 1,2 lo toco pero no lo hundo' do
    batalla_naval.ubicar_barco_en(1,1, "crucero", "horizontal")
    @resultado = batalla_naval.disparar_en(1,1)

    expect(@resultado).to eq Tocado

  end

end

describe 'disparo y hay barco' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando disparo en 1,1 y hay un crucero en 1,1 y 1,2 lo toco pero no lo hundo' do
    batalla_naval.ubicar_barco_en(1,1, "crucero", "horizontal")
    @resultado = batalla_naval.disparar_en(1,1)
    expect(@resultado).to eq Tocado
    @resultado = batalla_naval.disparar_en(2,1)
    expect(@resultado).to eq Hundido

  end

end