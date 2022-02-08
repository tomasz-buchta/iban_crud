FactoryBot.define do
  factory :iban do
    number { Faker::Bank.iban }
    sequence(:name) { |n| "name #{n}" }
  end
end

