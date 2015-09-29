require 'rspec'

require_relative '../model/elemento'


describe 'Piedra' do
  let(:piedra) {Piedra.new}
  let(:papel) {Papel.new}
  let(:tijera) {Tijera.new}
  let(:mono) {Mono.new}

  it 'Piedra deberia ganarle a Tijera' do
    expect(piedra.le_gana_a?(tijera)).to be_true
  end
end