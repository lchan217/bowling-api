class GameSerializer < ActiveModel::Serializer
  attributes :id, :pins, :score, :frame, :spareBalls, :strikeBalls, :turn,  :game_over, :total_score, :score_hash
end
