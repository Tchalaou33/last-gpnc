class User < ApplicationRecord
    has_secure_password
    has_many :movies
    validates :email, presence: true
    validates :email, uniqueness: true
end
