require_relative '../../model/batalla_naval'
require_relative '../../model/posicion'
require_relative '../../model/barco'

Given(/^la posicion (\d+),(\d+) del juego sin barco$/) do |x, y|
  @x = x.to_i
  @y = y.to_i

  @batalla_naval = BatallaNaval.new
end

When(/^disparo en posicion$/) do

  @resultado = @batalla_naval.disparar_en(@x,@y)

end

Then(/^toco agua$/) do
  expect(@resultado).to eq Agua
end