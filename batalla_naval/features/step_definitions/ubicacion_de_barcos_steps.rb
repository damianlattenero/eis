require_relative '../../model/batalla_naval'
require_relative '../../model/posicion'
require_relative '../../model/barco'


Given(/^la posicion del juego (\d+),(\d+) que esta vacía y un barco tipo submarino$/) do |x, y|
  @batalla_naval = BatallaNaval.new
  @x = x
  @y = y
end

When(/^ubico un barco tipo "([^"]*)"$/) do |submarino|
  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x,@y,submarino)
end

Then(/^se ubica exitosamente submarino$/) do
  @fallo_al_colocar.to_s.should == "Success barco colocado exitosamente"
end

Given(/^la posicion del juego (\d+),(\d+) y (\d+),(\d+) que estan vacías y un barco tipo crucero$/) do |x1, y1, x2, y2|
end

When(/^ubico un barco tipo crucero horizontal$/) do
end


Then(/^se ubica exitosamente crucero$/) do
end


