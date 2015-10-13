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

Given(/^la posición (\d+),(\d+) con barco tipo "([^"]*)" en la posicion (\d+),(\d+) y (\d+),(\d+) sin tener disparos$/) do |x, y, barco, arg4, arg5, arg6, arg7|
  @x = x.to_i
  @y = y.to_i

  @batalla_naval = BatallaNaval.new
  @batalla_naval.ubicar_barco_en @x, @y, barco, "horizontal"
end

When(/^disparo en esa posicion$/) do
  @resultado = @batalla_naval.disparar_en @x, @y
end

Then(/^lo toco pero no lo hundo$/) do
  expect(@resultado).to eq Tocado
end