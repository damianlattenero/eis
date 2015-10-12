require 'rspec'
require_relative '../model/batalla_naval'
require_relative '../model/barco'
require_relative '../model/posicion'


describe 'ubicacion de submarino' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo submarino en 1,1 deberia aparecer en la posicion 1,1 del tablero' do
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(1,1, "submarino")
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
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