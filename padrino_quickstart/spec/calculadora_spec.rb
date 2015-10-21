require 'rspec'

require_relative '../../padrino_quickstart/app/models/calculadora'

describe 'Calculadora' do

  it 'sumar correctamente' do
    expect(Calculadora.suma 2, 2).to eq 4
  end
end