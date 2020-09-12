FactoryBot.define do
  factory :order_donation do

    token             { "whook_362c8edafd3f9a1f9945c027d3" }
    adressnumber             { "000-1111" }
    area_id              { 2 }
    sichouson         {"札幌市"} 
    banchi          { "白石区１ー３" }
    bilding            { "ビル" }
    phonenumber          { "09011112222" }

    association :user
    association :item

  end
end