require 'rspec'

require_relative '../model/elemento'
require_relative '../model/resultado'


describe 'Piedra' do
  let(:piedra) {Piedra.new}
  let(:papel) {Papel.new}
  let(:tijera) {Tijera.new}
  let(:mono) {Mono.new}


  it 'Piedra deberia ganarle a Tijera' do
    expect(piedra.juega_con(Tijera)).to eq Gano
  end

  it 'Piedra deberia perder con Papel' do
    expect(piedra.juega_con(Papel)).to eq Perdio
  end

  it 'Piedra deberia empatar con Piedra' do
    expect(piedra.juega_con(Piedra)).to eq Empato
  end

  it 'Piedra deberia empatar con Mono' do
    expect(piedra.juega_con(Mono)).to eq Empato
  end
end

describe 'Papel' do
  let(:piedra) {Piedra.new}
  let(:papel) {Papel.new}
  let(:tijera) {Tijera.new}
  let(:mono) {Mono.new}


  it 'Papel deberia ganarle a Piedra' do
    expect(papel.juega_con(Piedra)).to eq Gano
  end

  it 'Papel deberia perder con Tijera' do
    expect(papel.juega_con(Tijera)).to eq Perdio
  end

  it 'Papel deberia empatar con Papel' do
    expect(piedra.juega_con(Piedra)).to eq Empato
  end

  it 'Papel deberia perder con Mono' do
    expect(papel.juega_con(Mono)).to eq Perdio
  end
end