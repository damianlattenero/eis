Given(/^voy a la pagina de la calculadora$/) do
  visit '/'
end

Given(/^un operando es (\d+)$/) do |n|
  with_scope('#calculadora') do
    fill_in('operando_1', with: n)
  end
end

Given(/^otro operando es (\d+)$/) do |n|
  with_scope('#calculadora') do
    fill_in('operando_2', with: n)
  end
end

When(/^los sumo$/) do
  with_scope('#calculadora') do
    select('suma', from: 'operacion')
    click_button('submit')
  end
end

When(/^los resto$/) do
  with_scope('#calculadora') do
    select('resta', from: 'operacion')
    click_button('submit')
  end
end

Then(/^el resultado es (\d+)$/) do |n|
  expect(page).to have_content("Resultado: #{n}")
end
