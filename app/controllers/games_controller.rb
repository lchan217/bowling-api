class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games, status: 201
    end

    def create
        game = Game.create(game_params)
    end

    def update 
        byebug
        game = Game.find(params[:id])
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame, :spareBalls, :strikeBalls, :turn, :game_over)
    end
end
