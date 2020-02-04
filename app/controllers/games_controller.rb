class GamesController < ApplicationController
    def index
        @games = Game.all
        render json: @games, status: 201
    end

    def create
        game = Game.create(pins: 10, score: 0, frame: 10)
        byebug
    end

    def update 
        game = Game.find(params[:id])
        render json: game
    end 
    
    def game_params
        params.require(:game).permit(:pins, :score, :frame)
    end
end
