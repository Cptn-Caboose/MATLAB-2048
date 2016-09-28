%%% Run this file to play MATLAB-2048 !
%
%   Version 1.1 (2016-09-28)
%       Added 'plot' of the board
%---------------------------------------------------------------------
clear, clc;
%Extra: high score %%%%%%%%%%%%%%%%%%%%%%%%
if exist('Highscore.mat', 'file') == 2    %
load('Highscore.mat');                    %
else                                      %
    hs = 0;                               %
end                                       %
hs_old = hs;                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 4;                          %Specify size of board
t = 1;
w = 0;                          %If 2048 occurs on the board, display once that user won, then go on.
[A, s] = InitialBoard(N);
disp(['Try to beat the high score: ',num2str(hs)])
plotBoard(A)

while t == 1
    B = A;                      %Keep a copy of A to check changes after trying to swipe
    m = ContinueBoard(N,A,s,hs,w);

    if m == 5
        error(['User aborted the game. Score = ',num2str(s),'. The score (although it might be a high score, will not be saved.'])
    end
    [A, s] = Swipe(N,A,s,m);
    if isequal(A,B) == 0        %If 0, the swipe was effective
        A = AddRandom(N,A);
    else
        disp('Swiping in this direction does not change the board, so is not allowed. Choose a different swipe.')
        z = input('Please press enter and choose a different swipe direction');
        continue
    end
    close;
    plotBoard(A)

    %Check if the board is full-%----------------------------------------
    nz = find(A==0);            %If the board is full, the game is not yet over!
    if isempty(nz) == 1         %There is a chance that the player can actually swipe and therefore
        m = 1:4;                %can create new empty places by a swipe. To check, swipes will be
        for i = m               %simulated in all directions. If no swipe works, the game is over.
            B = A;
            [A, ~] = Swipe(N,A,s,m);
            if isequal(A,B) == 0
                break
            end
        end
        t = 0;                  %If none of the simulated swipes is effective, break the game.
    end
end

disp(A)
disp(' ')
disp(['Score: ',num2str(s)])
hs_new = s;
if hs_new > hs
hs = hs_new;                         %Save high score
save('Highscore.mat','hs')
end
disp(' ')
error('Game over!')
