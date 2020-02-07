class GameController < ApplicationController
    def index
        game = Game.last
        render json: game, status: 201
    end

    def create
        game = Game.create(game_params)
    end

    def update 
        game = Game.last
        pinsKnockedDown = params[:numPins]
        game.score_points(game, pinsKnockedDown)
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :game_over, :score_hash, :total_score)
    end
end
