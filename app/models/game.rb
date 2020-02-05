class Game < ApplicationRecord
    def regular_round_turn_1(game, pinsKnockedDown, turn)
        if turn === 2
            pinsRemaining = 10 - pinsKnockedDown
            #strike
            if pinsKnockedDown === 10 
                game.strikeBalls += 2 
                game.score = 10 
                game.frame += 1
            #regular
            else 
                game.pins = (pinsRemaining)
                game.score = (pinsKnockedDown)
            end 
        end
        game.save
    end

    def regular_round_turn_2(game, pinsKnockedDown, turn)
        if turn === 1
            pinsRemaining = (10 - pinsKnockedDown - game.score )
            #spare
            if pinsRemaining === 0
                game.spareBalls += 1 
                game.score = 10 
                game.frame += 1 
                game.pins = 10 
            #regular 
            else 
                game.score = 10 - pinsRemaining 
                game.frame += 1 
                game.pins = 10 
            end
            game.save
        end
    end
end 
