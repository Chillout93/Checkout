require File.dirname(__FILE__) + '/rule.rb'
require File.dirname(__FILE__) + '/item.rb'
require File.dirname(__FILE__) + '/checkout.rb'

green_tea = Item.new("GR1", "Green Tea", 3.11)
strawberries = Item.new("SR1", "Strawberries", 5.00)
coffee = Item.new("CF1", "Coffee", 11.23)

promo_rule_2 =
  Rule.new do
      if @basket[strawberries.id] && @basket[strawberries.id][:quantity] >= 3 then 
          @basket[strawberries.id][:total] -= @basket[strawberries.id][:quantity] * 0.5
      end
  end
  
promo_rule_1 =
  Rule.new do
      if @basket[green_tea.id] && @basket[green_tea.id][:quantity] >= 2 then
          @basket[green_tea.id][:total] /= 2
          if @basket[green_tea.id][:quantity] % 2 != 0 then @basket[green_tea.id][:total] += @basket[green_tea.id][:price] / 2 end
      end
  end

@promotional_rules = [promo_rule_2, promo_rule_1]

co = Checkout.new(@promotional_rules)
co.scan(green_tea)
co.scan(strawberries)
co.scan(strawberries)
co.scan(strawberries)
co.print
