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
        turn = params[:turn]
        game.regular_round_turn_1(game, pinsKnockedDown, turn) 
        game.regular_round_turn_2(game, pinsKnockedDown, turn)
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :turn_2, :game_over, :score_hash)
    end
end
