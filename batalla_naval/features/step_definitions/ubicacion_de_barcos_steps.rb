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
  expect(@fallo_al_colocar.to_s).to eq "Success barco colocado exitosamente"
end

Given(/^la posicion del juego (\d+),(\d+) (\d+),(\d+) y (\d+),(\d+) que estan vacías y un barco tipo acorazado$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
  @x1 = arg1.to_i
  @y1 = arg2.to_i

  @batalla_naval = BatallaNaval.new
end

When(/^ubico un barco "([^"]*)" "([^"]*)"$/) do |tipo_barco, direccion|
  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x1,@y1,tipo_barco,direccion)
end


Then(/^se ubica exitosamente acorazado$/) do
  expect(@fallo_al_colocar.to_s).to eq  "Success barco colocado exitosamente"
end

#posiciones ocupadas
#submarino
Given(/^la posicion (\d+),(\d+) que tiene un "([^"]*)" ya ubicado y voy a ubicar un barco tipo submarino$/) do |x, y, barco|
  @x = x.to_i
  @y = y.to_i

  @batalla_naval = BatallaNaval.new
  @batalla_naval.ubicar_barco_en(@x, @y, barco)
end

When(/^ubico un barco tipo "([^"]*)" en posicion ocupada$/) do |barco|
  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x,@y,barco)
end

Then(/^no lo puedo ubicar$/) do
  expect(@fallo_al_colocar.to_s).to eq  "Failure ya hay un barco en esa posicion"
end

#crucero

Given(/^la posicion (\d+),(\d+) y (\d+),(\d+) que tiene un "([^"]*)" ya ubicado en (\d+),(\d+) y voy a ubicar un barco tipo "([^"]*)"$/) do |arg1, arg2, arg3, arg4, submarino, x, y, crucero|
  @x = x.to_i
  @y = y.to_i

  @batalla_naval = BatallaNaval.new
  @batalla_naval.ubicar_barco_en(@x, @y, submarino)
end

When(/^ubico un barco tipo "([^"]*)" "([^"]*)" en (\d+),(\d+) en posicion ocupada$/) do |crucero, horizontal,x1, y1|

  @x1 = x1.to_i
  @y1 = y1.to_i

  @fallo_al_colocar = @batalla_naval.ubicar_barco_en(@x1, @y1, crucero, horizontal)

end

Then(/^no lo puedo ubicar al crucero$/) do
  expect(@fallo_al_colocar.to_s).to eq  "Failure ya hay un barco en esa posicion"
end

Given(/^un batalla naval de (\d+) por (\d+) y la posicion (\d+),(\d+) y un barco tipo submarino$/) do |arg1, arg2, x, y|
  @x = x.to_i
  @y = y.to_i
  @batalla_naval = BatallaNaval.new
end

When(/^ubico mi barco tipo "([^"]*)"$/) do |submarino|
  begin
    @batalla_naval.ubicar_barco_en(@x, @y, submarino)
  rescue FueraDelTableroExcepcion => e
    @excepcion = e
  end

end

Then(/^no lo puedo ubicar fuera del tablero$/) do
  expect(@excepcion.message).to eq 'No se puede ubicar un barco fuera de las dimensiones del tablero'
end
