FactoryBot.define do
  factory :purchase_item do
    material 
    quantity { random.rand * 10 }
  end
end
