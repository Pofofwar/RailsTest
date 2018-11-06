# frozen_string_literal: true

class Stock < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  validates :unit_price, presence: true, numericality: true

  validates :interest, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true }

  validates :duration_in_years, presence: true, numericality: { less_than_or_equal_to: 10, only_integer: true }
end
