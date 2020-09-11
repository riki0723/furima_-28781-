FactoryBot.define do
  factory :user do
    nickname              {"abc"}
    email                 {Faker::Internet.email} # faker? sequence? email|x|@example
    password              {"aaa000"}
    password_confirmation {password}
    familyname            {"山田"}
    firstname             {"次郎"}
    familykana            {"ヤマダ"}
    firstkana             {"ジロウ"}
    berthday              {"1990-10-20"}
  end
end