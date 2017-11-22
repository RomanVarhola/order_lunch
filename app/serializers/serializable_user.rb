class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attributes :id, :first_name, :last_name, :email
end
