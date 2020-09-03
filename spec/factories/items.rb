FactoryBot.define do
  factory :item do
    image             {"img"}
    name              {"あああ"}
    explation         {"説明文"} 
    category_id          { 2 }
    status_id            { 2 }
    delivery_id          { 2 }
    area_id              { 2 }
    days_id              { 2 }
    price_id             { 500 }
    association :user 
  end
end
