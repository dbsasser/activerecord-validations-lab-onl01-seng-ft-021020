class Author < ActiveRecord::Base
  validates  :name, presence: true, uniqueness: true
  validate :phone_number, length: {minimumum: 10}
end
