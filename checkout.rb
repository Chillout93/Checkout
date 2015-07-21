class Checkout
  def initialize(rules = [])
    @basket = {}
    @rules = rules
    @total = 0.0
  end
    
  def scan(item)
    if @basket[item.id] then 
      @basket[item.id][:quantity] += 1
      @basket[item.id][:total] += item.price
    else 
      @basket[item.id] = { :name => item.name, :quantity => 1, :price => item.price, :total => item.price}
    end
  end
  
  def apply_rule
    @rules.each do |rule|
        rule.apply_to(self)
    end
  end
  
  def print
      apply_rule
      puts "-"*20
      @basket.each do |item, values|
          puts "#{values[:quantity]} x #{values[:name]} = #{values[:total]}"
          @total += values[:total].to_f
      end
      puts "-"*20
      puts "total: #{sprintf("%.2f", @total)}"
  end
end