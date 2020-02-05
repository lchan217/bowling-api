class Game < ApplicationRecord
    def regular_round_turn_1(game, pinsKnockedDown)
        if game.turn === 2 
            #strike
            if pinsKnockedDown === 10 
                game.strikeBalls = 2 
                game.score = 10 
                game.frame += 1
            #regular round
            else 
                game.turn -= 1
                game.pins = (10-pinsKnockedDown)
                game.score = (pinsKnockedDown)
            end 
        end
        game.save
    end

    # def game.regular_round_turn_2(game, pinsKnockedDown)
    #     if game.turn === 1 
            
    #     end
    #     game.save
    # end
end 
