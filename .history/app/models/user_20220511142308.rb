class User < ApplicationRecord
  validates :username,presence: true, length:{minimum: 5, maximum: 30}
  validates :email,presence: true, length:{maximum: 125}

end
