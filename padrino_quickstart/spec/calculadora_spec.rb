require 'rspec'

require_relative '../../padrino_quickstart/app/models/calculadora'

describe 'Calculadora' do

  it 'sumar 2 y 2 da 4' do
    expect(Calculadora.suma 2, 2).to eq 4
  end

  it 'sumar 20 y 22 da 42' do
    expect(Calculadora.suma 22, 20).to eq 42
  end

  it 'restar 20 y 22 da -2' do
    expect(Calculadora.resta 20, 22).to eq -2
  end

  it 'promedio 8 y 10 da 9' do
    expect(Calculadora.promedio 8, 10).to eq 9
  end
end