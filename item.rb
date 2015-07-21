class Item
  attr_reader :id
  attr_accessor :name, :price
  
  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
  end
end