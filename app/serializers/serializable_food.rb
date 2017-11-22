class SerializableFood < JSONAPI::Serializable::Resource
  type 'foods'
  attributes :id, :title, :ftype, :price
end
