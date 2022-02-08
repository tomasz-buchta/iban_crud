class Iban < ApplicationRecord
  validates :name, presence: true
  # TODO: There should proper iban validation - preventing user from saving malformed/invalid ibans
  validates :number, presence: true
end

