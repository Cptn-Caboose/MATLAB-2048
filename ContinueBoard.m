function m = ContinueBoard(N,A,s,hs,w)
clc
disp(A)
disp(' ')
disp(['Score: ',num2str(s)])
disp(['High score: ',num2str(hs)])
disp(' ')
x = find(A==2048);
if isempty(x) ~= 1 && w == 0
    disp('You won! Now, try to get 4096...')
    w = 1;
end

m = input('Choose a direction for the next swipe!\n 1: LEFT, 2: UP, 3: RIGHT, 4: DOWN\n\n','s');

%% Allow textual input (WASD or IJKL)
if m == 'w' || m == 'i'
    m = 2;
elseif m == 'a' || m == 'j'
    m = 1;
elseif m == 's' || m == 'k'
    m = 4;
elseif m == 'd' || m == 'l'
    m = 3;
elseif m == 'q'
    m = 5;
else
    m = str2num(m);
end




