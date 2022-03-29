FactoryBot.define do
  factory :material do 
    title { Faker::Commerce.product_name }
    quantity { (Random.rand * 10).floor }
  end
end