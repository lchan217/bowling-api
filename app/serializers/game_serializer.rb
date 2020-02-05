class GameSerializer < ActiveModel::Serializer
  attributes :id, :pins, :score, :frame, :spareBalls, :strikeBalls, :turn
end
