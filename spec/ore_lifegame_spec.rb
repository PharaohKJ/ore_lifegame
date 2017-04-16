require "spec_helper"

RSpec.describe OreLifegame do
  it "has a version number" do
    expect(OreLifegame::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  it "can create classes" do
    expect(OreLifegame::LifeGame.new).not_to be nil
    expect(OreLifegame::Cell.new).not_to be nil
  end

  it "can create Board" do
    x_size = 10
    y_size = 10
    cells = OreLifegame::Board.new(x_size, y_size).cells
    expect(cells.size).to eq(y_size)
    expect(cells[0].size).to eq(x_size)
  end
end
