FactoryBot.define do
  factory :purchase_item do
    material 
    purchase
    quantity { random.rand * 10 }
  end
end
