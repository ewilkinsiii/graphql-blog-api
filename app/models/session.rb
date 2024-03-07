class Session < ApplicationRecord
  belongs_to :user

  before_create do
    self.token = SecureRandom.hex(40)
  end
end
