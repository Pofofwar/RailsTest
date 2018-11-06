# frozen_string_literal: true

class User < ApplicationRecord
  has_many :stocks

  has_secure_password

  validates :name, presence: true

  validates :email, presence: true, uniqueness: true, format: {
    with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  }

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  validates :password, presence: true, length: { minimum: 5 }

  validates :password, confirmation: { case_sensitive: true }
end
