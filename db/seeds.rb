10.times do |i|
  # FIXME: This can result in non unique iban number
  iban = FactoryBot.build(:iban)
  iban.name = "Iban acc no #{i}"
  iban.save!
end

