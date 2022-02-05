FactoryBot.define do
  factory :iban do
    number { Faker::Bank.iban }
    name { Faker::Books::Dune.character }
  end
end

