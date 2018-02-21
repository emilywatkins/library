require("spec_helper")

describe(".all") do
  it("starts off with no lists") do
    expect(Book.all()).to(eq([]))
  end
end
