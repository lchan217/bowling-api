class GameSerializer < ActiveModel::Serializer
  attributes :id, :pins, :score
end
