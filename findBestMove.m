function[bestMove, bestScore] = findBestMove(boardstate, player, depth, bestMove)
    % recursive function for bot that determines the best moves
    if nargin < 4
        bestMove = 4;  % initialize bestMove only if it's not provided
    end
    
    % initialize bestScore and otherPlayer
    bestScore = -200;
    otherPlayer = switchPlayer(player);
    
    % check for situations with 4 in a row and 3 in a row, appropriately
    % applying score to each situation
    [gameWin, playerWin, threeRow] = checkWinning(boardstate);
    if threeRow == true && playerWin == otherPlayer
        bestScore = -150;
    end
    if gameWin == true && playerWin == otherPlayer
        bestScore = -128;
        return 
    elseif gameWin == false
    end
    
    % if it has finished searching possible moves, stop the function
    if depth == 0
        return
    end
    
    % for each possible move of the selected player
    for n = 1:7
        % make the move on a seperate board
        newBoard = boardstate;
        targetColumnBot = [];
        for y = 1:6
            targetColumnBot = [targetColumnBot, newBoard(y, n)];
        end
        for y = 1:length(targetColumnBot)
            element = targetColumnBot(y);
            if element == 0
                newBoard(y, n) = player;
                break
            end
        end
        
        % recall the function for the new boardstate on the seperateboard
        [bestMove, score] = findBestMove(newBoard, otherPlayer, depth-1, bestMove);
        
        % divide the score by 2, meaning that future simulations have less
        % effect on the chosen move and encouraging a more aggressive
        % playstyle
        array = [bestMove, score];
        array(2) = score/2;
        
        % save the best score and associated best move once the function
        % finds a move that achieves the highest score
        if score > bestScore
            bestScore = score;
            bestMove = n;
        end
    end
    return
end
