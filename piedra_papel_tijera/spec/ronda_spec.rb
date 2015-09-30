require 'rspec'
require_relative '../model/ronda'
require_relative '../model/jugador'


describe 'Jugador1 gana ronda' do
  let(:jugador1) {Jugador.new}
  let(:jugador2) {Jugador.new}
  let(:ronda) {Ronda.new(jugador1,jugador2)}

  it 'Jugador1 juega papel y jugador2 juega piedra, deberia ganar jugador1' do
    ronda.jugar(Papel, Piedra)
    expect(jugador1.victorias).to eq 1
  end
end