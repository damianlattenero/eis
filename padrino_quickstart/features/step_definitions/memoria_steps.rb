When(/^no hice operaciones$/) do
  visit '/'
end

Then(/^la cantidad de operaciones es (\d+)$/) do |arg1|
  expect(page).to have_content("operaciones = #{arg1}")
end
