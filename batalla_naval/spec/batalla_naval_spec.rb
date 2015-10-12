require 'rspec'
require_relative '../model/batalla_naval'
require_relative '../model/barco'
require_relative '../model/posicion'


describe 'ubicacion de submarino' do
  let(:batalla_naval) { BatallaNaval.new }

  it 'cuando coloco un barco tipo submarino en 1,1 deberia aparecer en la posicion 1,1 del tablero' do
    @submarino = Submarino.new
    @posicion = Posicion.new(1,1)
    batalla_naval.ubicar_barco_en(@posicion, @submarino)
    expect(batalla_naval.hay_barco_en?(@posicion)).to be_truthy
  end


end

