class ItemSerializer < ActiveModel::Serializer
  attributes :id, 
  :name,
  :category, 
  :rate, 
  :quantity, 
  :per, 
  :category
  
  def category
    {name: self.object.category.name}
  end
end
