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
        game.regular_round(game, pinsKnockedDown) 
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :turn_2, :game_over, :score_hash)
    end
end
