function[] = winState(gameWin,player)
% print messages depending on game outcome
    if gameWin == true
        if player == 1
           disp('Contratulations! You win!') 
           return
        elseif player == 2
            disp('Too bad, so sad... You lose.')
            return
        end
    end
end