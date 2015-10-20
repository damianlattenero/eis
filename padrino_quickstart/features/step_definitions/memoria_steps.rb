When(/^no hice operaciones$/) do
  visit '/'
end

Then(/^la cantidad de operaciones es (\d+)$/) do |arg1|
  expect(page).to have_content("Operaciones: #{arg1}")
end

When(/^hago una suma$/) do
  visit '/'
  with_scope('#calculadora') do
    fill_in('operando_1', with: 2)
    fill_in('operando_2', with: 2)
    select('suma', from: 'operacion')
    click_button('submit')
  end
end
