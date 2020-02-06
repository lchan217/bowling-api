class GameSerializer < ActiveModel::Serializer
  attributes :id, :pins, :score, :frame, :spareBalls, :strikeBalls, :turn,  :game_over, :score_hash
end
