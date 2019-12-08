class Admin < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 75},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password_congregate, presence: true, length: {minimum: 6}
end
