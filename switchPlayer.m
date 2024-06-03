function nextPlayer = switchPlayer(currentPlayer)
% swap the player between 1 and 2
    if currentPlayer == 1
        nextPlayer = 2;
    else
        nextPlayer = 1;
    end
end