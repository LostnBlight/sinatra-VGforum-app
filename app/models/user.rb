class User < ActiveRecord::Base
    has_secure_password

    # Using ActiveRecords validations to prevent Creating, updating, or saving if these validations are not meant.
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :complaints

end
