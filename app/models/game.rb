class Game < ApplicationRecord
    def regular_round(game, pinsKnockedDown)
        #normal second round? order matters
        if game.turn === 1 && pinsKnockedDown + game.score != 10
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown
            game.turn = 2 
            game.pins = 10 
            game.frame += 1 
            game.save
            exit
        end    

        startingFrame = game.frame
        #strike? 
        if game.turn === 2 && pinsKnockedDown === 10 
            game.score_hash[game.frame] ? game.score_hash[game.frame] += 10 :  game.score_hash[game.frame] = 10
            game.frame += 1 
            game.strikeBalls += 2
            game.save 
        end

        #normal first round? 
        if game.turn === 2 && startingFrame == game.frame
            pinsRemaining = 10 - pinsKnockedDown
            game.pins = pinsRemaining
            game.score = pinsKnockedDown
            game.turn = 1 
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown
            game.save
        end 
        
        #spare? 
        if game.turn === 1 && pinsKnockedDown + game.score === 10
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown
            game.turn = 2 
            game.frame += 1
            game.pins = 10 
            game.spareBalls += 1
            game.save
        end 
   
    end
end 
