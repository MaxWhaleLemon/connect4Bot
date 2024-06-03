function[gameWin, playerWin, threeRow] = checkWinning(boardstate)
   
    %instantiate variables for checking three and 4 in a row
    threeRow = false;
    playerWin = 0;
    
    % win conditions
    gameWin = false;
    % for each player and every tile of the boardstate
    for player = 1:2
        for y = 1:size(boardstate, 1)
            for x = 1:size(boardstate, 2)
                if boardstate(y, x) == player
                    % checking for 4 in a row horizontally
                    if x+1 <= size(boardstate, 2) && boardstate(y, x+1) == player 
                        if x+2 <= size(boardstate, 2) && boardstate(y, x+2) == player
                            threeRow = true;
                            if x+3 <= size(boardstate, 2) && boardstate(y, x+3) == player
                                gameWin = true;
                                playerWin = player;
    
                                % plot thorugh the winning connection
                                winX = [x-0.5, x+2.5];
                                winY = [y-0.5, y-0.5];
                                plot(winX, winY, 'g-', 'LineWidth', 5)
    
                                return
                            end
                        end
                    end
                    % checking for 4 in a row diagonally to the right
                    if y+1 <= size(boardstate, 1) && x+1 <= size(boardstate, 2) && boardstate(y+1, x+1) == player
                        if y+2 <= size(boardstate, 1) && x+2 <= size(boardstate, 2) && boardstate(y+2, x+2) == player
                            threeRow = true;
                            if y+3 <= size(boardstate, 1) && x+3 <= size(boardstate, 2) && boardstate(y+3, x+3) == player
                                gameWin = true;
                                playerWin = player;
    
                                % plot thorugh the winning connection
                                winX = [x-0.5, x+2.5];
                                winY = [y-0.5, y+2.5];
                                plot(winX, winY, 'g-', 'LineWidth', 5)
    
                                return
                            end
                        end
                    end
                    % checking for 4 in a row vertically
                    if y+1 <= size(boardstate, 1) && boardstate(y+1, x) == player
                        if y+2 <= size(boardstate, 1) && boardstate(y+2, x) == player
                            threeRow = true;
                            if y+3 <= size(boardstate, 1) && boardstate(y+3, x) == player
                                gameWin = true;
                                playerWin = player;
    
                                % plot thorugh the winning connection
                                winX = [x-0.5, x-0.5];
                                winY = [y-0.5, y+2.5];
                                plot(winX, winY, 'g-', 'LineWidth', 5)
    
                                return
                            end
                        end
                    end
                    % checking for 4 in a row diagonally to the left
                    if y+1 <= size(boardstate, 1) && x-1 <= size(boardstate, 2) && x-1 >= 1 && boardstate(y+1, x-1) == player
                        if y+2 <= size(boardstate, 1) && x-2 <= size(boardstate, 2) && x-2 >= 1 && boardstate(y+2, x-2) == player
                            threeRow = true;
                            if y+3 <= size(boardstate, 1) && x-3 <= size(boardstate, 2) && x-3 >= 1 && boardstate(y+3, x-3) == player
                                gameWin = true;
                                playerWin = player;
    
                                % plot thorugh the winning connection
                                winX = [x-0.5, x-3.5];
                                winY = [y-0.5, y+2.5];
                                plot(winX, winY, 'g-', 'LineWidth', 5)
    
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end