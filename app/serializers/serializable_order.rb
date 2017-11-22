class SerializableOrder < JSONAPI::Serializable::Resource
  type 'orders'
  attributes :id, :date, :total_price
  
  belongs_to :user
  has_one :food
  has_one :drink
end
