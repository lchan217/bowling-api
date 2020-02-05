class GameSerializer < ActiveModel::Serializer
  attributes :id, :pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :turn_2,  :game_over
end
