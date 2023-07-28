class UserSerializer < ActiveModel::Serializer
  attributes  :id, :email, :role
  has_one :profile
end
