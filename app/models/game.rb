class Game < ApplicationRecord
    include GameConcern

    def score_points(game, pinsKnockedDown)
        startingFrame = game.frame

        #strike? 
        if game.turn === 2 && pinsKnockedDown === 10 
            game.score_hash[game.frame] ? game.score_hash[game.frame] += 10 :  game.score_hash[game.frame] = 10
            game.score = pinsKnockedDown
            previous_strike(game)
            previous_spare(game)
            game.frame += 1 
            game.strikeBalls += 2
            game.calculate_total(game)
            game.save
            exit
        end

        #normal first round? 
        if game.turn === 2 && startingFrame == game.frame
            pinsRemaining = 10 - pinsKnockedDown
            game.pins = pinsRemaining
            game.score = pinsKnockedDown
            game.turn = 1 
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown
            
            previous_strike(game)
            previous_spare(game)
            game.calculate_total(game)
            game.save
            exit
        end 
        
        #spare? 
        if game.turn === 1 && pinsKnockedDown + game.score === 10
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown
            game.turn = 2 
            game.score = pinsKnockedDown

             #end of game (spare)
             if game.frame === 10
                game.spareBalls += 1
                game.pins = 10 
                game.calculate_total(game)
                game.save
                exit
            end
            previous_strike(game)
            previous_spare(game)
            game.frame += 1
            game.pins = 10 
            game.spareBalls += 1
            game.calculate_total(game)
            game.save
            exit
            
        end 

        #normal second round?
        if game.turn === 1 && pinsKnockedDown + game.score != 10
            game.score = (pinsKnockedDown)
            game.score_hash[game.frame.to_s] ? game.score_hash[game.frame.to_s] += pinsKnockedDown :  game.score_hash[game.frame.to_s] = pinsKnockedDown           
            previous_strike(game)
            previous_spare(game)

            game.frame += 1
            game.turn = 2 
            game.pins = 10 
            game.calculate_total(game)
            game.save
            exit
        end
    end
end 
