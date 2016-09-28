function [A, s] = InitialBoard(N)
% Creates NxN matrix
% Creates two numbers (values 2 or 4) at two random positions.
% Set score to zero

A = zeros(N);
s = 0;

[i1,j1,v1] = createNumber(N);                %Create first number
A(i1,j1) = v1;                              %Place first number in A

unique = 0;                                 %The second number must have a different position than ...
while unique ~= 1                           %the first number. Therefore, create new positions for ...
    [i2,j2,v2] = createNumber(N);            %the second number until its position is unique. 
    if i1 == i2 && j1 == j2
        unique = 0;
    else
        unique = 1;
        A(i2,j2) = v2;
    end
end


% Display game, score and additional info
clc
disp(A)
disp(' ')
disp(['Score: ',num2str(s)]) 
disp(' ')   
disp('Start the game!')

end
