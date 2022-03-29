FactoryBot.define do
  factory :order_item do
    material 
    order 
    quantity { random.rand * 10 }
  end
end
