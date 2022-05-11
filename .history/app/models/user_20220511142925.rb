class User < ApplicationRecord
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length:{ minimum: 5, maximum: 30 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length:{maximum: 125}
end
