function A = AddRandom(N,A)

% Get all nonzero elements in A
nz = find(A==0);

%The indexing of nz is strange! Suppose N = 4, then the indexes are
%
%   1   5   9   13
%   2   6   10  14
%   3   7   11  15
%   4   8   12  16
%
randomPosition = ceil(rand*length(nz));
val = rand;
if val < 0.9
    val = 2;
else
    val = 4;
end
A(nz(randomPosition)) = val;