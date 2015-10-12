require_relative '../../model/batalla_naval'
require_relative '../../model/posicion'
require_relative '../../model/barco'

#submarino
Given(/^la posicion del juego (\d+),(\d+) que esta vacía y un barco tipo submarino$/) do |x, y|
  @batalla_naval = BatallaNaval.new
  @x = x.to_i
  @y = y.to_i
end

When(/^ubico un barco tipo "([^"]*)"$/) do |tipo_barco|
  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x,@y,tipo_barco)
end

Then(/^se ubica exitosamente submarino$/) do
  @fallo_al_colocar.to_s.should == "Success barco colocado exitosamente"
end

#crucero

Given(/^la posicion del juego (\d+),(\d+) y (\d+),(\d+) que estan vacías y un barco tipo crucero$/) do |x1, y1, x2, y2|
  @x1 = x1.to_i
  @x2 = x2.to_i
  @y1 = y1.to_i
  @y2 = y2.to_i

  @batalla_naval = BatallaNaval.new
end

When(/^ubico un barco tipo "([^"]*)" "([^"]*)"$/) do |tipo_barco, direccion|
  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x1,@y1,tipo_barco,direccion)
end

Then(/^se ubica exitosamente crucero$/) do
  @fallo_al_colocar.to_s.should == "Success barco colocado exitosamente"
end


