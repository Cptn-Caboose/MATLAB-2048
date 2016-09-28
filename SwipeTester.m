clear, clc;
A = [0 2 0 2; 4 2 2 0; 0 0 4 2; 4 4 4 16];
N = 4;
s = 0;
%------------------------------------------------------------------------------------------------------
%Stage I: swipe
for i = 1:N
    nz = find(A(i,:)~=0);                                %Check which elements are nonzero.
    if length(nz) ~= N                                   %Only shift if a row contains zeros.
        A(i,:) = [zeros(1,N-length(nz)) A(i,nz)];        %We shift all nonzero elements to the left.
    end
end

%Stage II: merge and score
for i = 1:N
    for j = N:-1:2
        if A(i,j) == A(i,j-1)                            %Check if two neighbours have the same value
            A(i,j-1) = 2*A(i,j);                         %If so, merge them
            A(i,j) = 0;                                  %Remove the value that just merged
            s = s+A(i,j-1)/2;                            %Add the score
        end
    end
end

%Stage III: swipe again
for i = 1:N
    nz = find(A(i,:)~=0);                                %Check which elements are nonzero.
    if length(nz) ~= N                                   %Only shift if a row contains zeros.
        A(i,:) = [zeros(1,N-length(nz)) A(i,nz)];        %We shift all nonzero elements to the left.
    end
end
disp(A)