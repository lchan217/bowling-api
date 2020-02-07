module GameConcern
    extend ActiveSupport::Concern
        def previous_spare(game)
            if game.spareBalls > 0 
                game.spareBalls -= 1
                previousFrame = game.frame - 1
                if game.frame != 10 
                    game.score_hash[previousFrame.to_s] += game.score
                end
            end
        end
        def previous_strike(game)
            previousFrame = game.frame - 1
            previouspreviousFrame = previousFrame - 1
            if game.strikeBalls > 0 
                game.strikeBalls -= 1
                game.score_hash[previousFrame.to_s] += game.score 
            end

            #2 strikes in a row
            if game.score_hash[previouspreviousFrame.to_s] === 20 && spareBalls == 0 && game.turn === 2 && game.score_hash[game.frame.to_s] != 10
                game.score_hash[previouspreviousFrame.to_s] += game.score
                game.strikeBalls = 1
            end
        end
        def calculate_total(game)
            total = 0 
            #regular round
            game.score_hash.each do |frame, score|
                total += score
            end

            #strike scored in final round, 1st throw
            if game.frame === 11 && game.strikeBalls === 1 
                total -= game.score_hash[game.frame.to_s]
            end

            #strike scored in final round, 2nd throw
            if game.frame === 12 && game.strikeBalls === 0
                game.total_score += game.score
                game.game_over = true 
                game.save
                exit
            end

            #spare scored  in final round, only throw
            if game.frame === 10
                game.total_score += game.score
                game.game_over = true 
                game.save
                exit
            end 

            game.total_score = total
        end
       
  end