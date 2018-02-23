require("spec_helper")

describe(".all") do
  it("starts off with no patrons") do
    expect(Patron.all()).to(eq([]))
  end
end

describe("#save") do
  it("lets you save patrons to the database") do
    patron = Patron.new({:id => nil, :name => "patron name"})
    patron.save()
    expect(Patron.all()).to(eq([patron]))
  end
end

describe("#id") do
  it("sets its ID when you save it") do
    patron = Patron.new({:id => nil, :name => "patron name"})
    patron.save()
    expect(patron.id()).to(be_an_instance_of(Fixnum))
  end
end

describe("#==") do
  it("is the same patron if it has the same name and id") do
    patron1 = Patron.new({:id => nil, :name => "patron name"})
    patron2 = Patron.new({:id => nil, :name => "patron name"})
    expect(patron1).to(eq(patron2))
  end
end

describe(".find") do
  it("returns a patron by its ID") do
    patron1 = Patron.new({:id => nil, :name => "patron name"})
    patron1.save()
    patron2 = Patron.new({:id => nil, :name => "patron name"})
    patron2.save()
    expect(Patron.find(patron2.id())).to(eq(patron2))
  end
end
