class User < ApplicationRecord
  validates :username,presence: true, length:{min:5,max:30}

end
