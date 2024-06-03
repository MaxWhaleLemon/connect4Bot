clear
clc

fprintf('Welcome to a Connect 4 bot made by Max Lehman!\n');

% create a blank matrix out of zeros
boardstate = zeros(6, 7);

% controls gamestate and determines when to end the game
gameWin = false;
while gameWin == false
    
    % player turn (ask the user for an input and play it)
    selectedMove = 0;
    while selectedMove ~= 1:7
        selectedMove = input('Which column? (1-7) ');
    end
    targetColumn = []; 
    % create a fake snapshot vector of the chosen column in order to make 
    % the piece 'fall' ontop of the other pieces
    for y = 1:6
        targetColumn = [targetColumn, boardstate(y, selectedMove)];
    end
    % put player turn onto board
    for y = 1:length(targetColumn)
        element = targetColumn(y);
        if element == 0
            boardstate(y, selectedMove) = 1;
            break
        end
    end
  
    % robot turn (recursively choose a position and play it)
    [selectedMove,bestScore] = findBestMove(boardstate, 2, 5);
    targetColumn = []; 
        for y = 1:6
            targetColumn = [targetColumn, boardstate(y, selectedMove)];
        end

    % put robot turn onto board
    for y = 1:length(targetColumn)
        element = targetColumn(y);
        if element == 0
            boardstate(y, selectedMove) = 2;
            break
        end
    end
        
    % set up border around the boardstate visual
    borderX = [0, 0, 7, 7, 0];
    borderY = [0, 6, 6, 0, 0];
    
    close all;  %close all figure windows
    displayBoard = figure; % display the board
    grid on; % turn on the figure grid
    hold on; % display plots on the same window
    
    % plot the border of the game board
    plot(borderX, borderY)
    
    % prepare the board for plotting on figure by flipping it
    
    % instantiate vectors for each piece in order to plot them on the figure
    displayX = [];
    displayY = [];
    
    % find the x and y coordinates of the bot's and player's moves and store
    % them in the row and column variables
    for y = 1:numel(boardstate)
        if y == 1
            [rowP, columnP] = find(boardstate == y);
        elseif y == 2
            [rowB, columnB] = find(boardstate == y);
        end
    end
    
    % calculate and plot the positions of each move on the screen in a stylised
    % format 
    for y = 1:length(rowP)
            displayY = [rowP(y)-0.1, rowP(y)-0.9, rowP(y)-0.9, rowP(y)-0.1, rowP(y)-0.1];
            displayX = [columnP(y)-0.1, columnP(y)-0.1, columnP(y)-0.9, columnP(y)-0.9, columnP(y)-0.1];
            plot(displayX, displayY, 'r-', 'LineWidth', 1)
            displayY = [rowB(y)-0.1, rowB(y)-0.9, rowB(y)-0.9, rowB(y)-0.1, rowB(y)-0.1];
            displayX = [columnB(y)-0.1, columnB(y)-0.1, columnB(y)-0.9, columnB(y)-0.9, columnB(y)-0.1];
            plot(displayX, displayY, 'b-', 'LineWidth', 1)
    end

    % Check if anybody has won and 
    [gameWin, playerWin, threeRow] = checkWinning(boardstate);
    
    if gameWin == true
        winState(gameWin,playerWin)
    end
    
    hold off;  % turn off plotting on the same window.
end