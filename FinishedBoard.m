function z = FinishedBoard(N,A)
% z = 0: unfinished (zeros present in A)
% z = 1: finished game (no empty tiles left)
empty = find(A==0);
if isempty(empty) == 1
    z = 1;
else
    z = 0;
end