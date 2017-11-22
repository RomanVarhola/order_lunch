class SerializableDrink < JSONAPI::Serializable::Resource
  type 'drinks'
  attributes :id, :title, :dtype, :price
end
