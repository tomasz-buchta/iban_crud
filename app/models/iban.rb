class Iban < ApplicationRecord
  validates :name, presence: true
  validates :number, presence: true

  validate :iban_checksum

  EXTENDED_ASCII_SHIFT = 55

  def iban_checksum
    # TODO: This is only checking the checksum,
    # proper iban validation is more complex than this, but it serves as good 1st step
    # Next steps could be:
    # - country code validation and
    # - length validation(its country specific)
    # - check BBAN
    # - country specific iban format and structure
    return unless number.present?

    # Move first 4 charactes to the end of string
    checked_number = number[4, number.length - 1] + number[0, 4]
    # Replace letters with their respective digits as per ascii table (ex A => 10, B => 11)
    checked_number =
      checked_number
      .chars
      .map { |char| char.match(/[A-Z]/) ? char.ord - EXTENDED_ASCII_SHIFT : char }

    errors.add(:number, "Checksum invalid") if checked_number.join.to_i % 97 != 1
  end
end

