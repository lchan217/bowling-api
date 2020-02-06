module GameConcern
    extend ActiveSupport::Concern
        def previous_spare(game)
            if game.spareBalls > 0 
                game.spareBalls -= 1
                previousFrame = game.frame - 1
                if game.frame != 10 
                    game.score_hash[previousFrame.to_s] += game.score
                end
                #scored a spare in the last round?
                if game.frame === 10
                    game.game_over = true 
                    game.save
                    exit
                end 
            end
        end
        def previous_strike(game)
            previousFrame = game.frame - 1
            previouspreviousFrame = previousFrame - 1
            # byebug
            if game.strikeBalls > 0 
                game.strikeBalls -= 1
                game.score_hash[previousFrame.to_s] += game.score
            end

              #2 strikes in a row
            if game.score_hash[previouspreviousFrame.to_s] === 20 
                game.score_hash[previouspreviousFrame.to_s] += game.score
                game.strikeBalls = 1
            end 
        end
  end