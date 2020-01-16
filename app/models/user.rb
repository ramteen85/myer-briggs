class User < ApplicationRecord

    has_secure_password

    validates :username, presence: true, uniqueness: true

    validates :fullname, presence: true

    validates :age, presence: true

    validates :gender, presence: true

    validates :country, presence: true

    validates :state, presence: true

    validates :city, presence: true

end