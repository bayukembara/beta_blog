class User < ApplicationRecord
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 5, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #this is constant
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 125 },
                    format: { }
end
