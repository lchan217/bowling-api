class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games, status: 201
    end

    def create
        game = Game.create(pins: 10, score: {}, frame: 10, spareBalls: 0, strikeBalls: 0, turn: 2)
    end

    def update 
        game = Game.find(params[:id])
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn)
    end
end
