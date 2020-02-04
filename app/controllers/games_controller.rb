class GamesController < ApplicationController
    def index
        @games = Game.all
        render json: @games, status: 201
    end

    def create
        game = Game.new
    end

    def update 
        game = Game.find(params[:id])
        render json: game
    end 
    
    def book_params
        params.require(:game).permit(:pins, :score)
    end
end
