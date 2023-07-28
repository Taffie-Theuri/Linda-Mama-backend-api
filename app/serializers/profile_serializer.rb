class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :avatar, :age, "sex", :bio
end
