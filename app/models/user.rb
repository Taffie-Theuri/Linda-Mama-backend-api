class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
    has_one :profile
end
