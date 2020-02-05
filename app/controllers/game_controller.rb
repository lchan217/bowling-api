class GameController < ApplicationController
    def index
        games = Game.all
        render json: games, status: 201
    end

    def create
        game = Game.create(game_params)
        # game.subtract(game) 
    end

    def update 
        game = Game.last
        # pinsRemaining = 10 - params[:_json]
        # game.update(pins: pinsRemaining)
        debugger
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :game_over)
    end
end
