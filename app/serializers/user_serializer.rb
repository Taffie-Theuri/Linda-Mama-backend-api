class UserSerializer < ActiveModel::Serializer
  attributes  :email, :role
  has_one :profile
end
