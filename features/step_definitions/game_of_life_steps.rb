Given(/^the following setup$/) do |table|
  # table is a Cucumber::Ast::Table
  board = table.raw
  @game = GameOfLife.new(board)
end

When(/^I evolve the board$/) do
  @game.tick
end

Then(/^the center cell should be dead$/) do
  expect(@game.center_cell).to eq '.'
end

Then(/^the center cell should be alive$/) do
  expect(@game.center_cell).to eq 'x'
end

Then(/^I should see the following board$/) do |table|
  # table is a Cucumber::Ast::Table
  board = table.raw
  expect(@game.board).to eq board
end