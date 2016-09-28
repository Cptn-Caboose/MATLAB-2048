function [A, s] = Swipe(N,A,s,m)

%% 1: Swipe LEFT
if m == 1
    %Stage I: swipe
    for i = 1:N
        nz = find(A(i,:)~=0);                                %Check which elements are nonzero.
        if length(nz) ~= N                                   %Only shift if a row contains zeros.
            A(i,:) = [A(i,nz) zeros(1,N-length(nz))];        %We shift all nonzero elements to the left.
        end
    end
    
    %Stage II: merge and score
    for i = 1:N
        for j = 1:N-1
            if A(i,j) == A(i,j+1)                            %Check if two neighbours have the same value
                A(i,j) = 2*A(i,j);                           %If so, merge them
                A(i,j+1) = 0;                                %Remove the value that just merged
                s = s+A(i,j)/2;                              %Add the score
            end
        end
    end
    
    %Stage III: swipe again
    for i = 1:N                                              %If numbers are merged, there might be zeros in between
        nz = find(A(i,:)~=0);                                %some of the numbers in the matrix A.
        if length(nz) ~= N                                   %Thus, we swipe again.
            A(i,:) = [A(i,nz) zeros(1,N-length(nz))];
        end
    end
end

%% 2: Swipe UP
if m == 2
    %Stage I: swipe
    for i = 1:N
        nz = find(A(:,i)~=0);                                %Check which elements are nonzero.
        if length(nz) ~= N                                   %Only shift if a row contains zeros.
            A(:,i) = vertcat(A(nz,i), zeros(N-length(nz),1));%We shift all nonzero elements to the left.
        end
    end
    
    %Stage II: merge and score
    for i = 1:N-1
        for j = 1:N
            if A(i,j) == A(i+1,j)                            %Check if two neighbours have the same value
                A(i,j) = 2*A(i,j);                           %If so, merge them
                A(i+1,j) = 0;                                %Remove the value that just merged
                s = s+A(i,j)/2;                              %Add the score
            end
        end
    end
    
    %Stage III: swipe again
    for i = 1:N
        nz = find(A(:,i)~=0);                                %Check which elements are nonzero.
        if length(nz) ~= N                                   %Only shift if a row contains zeros.
            A(:,i) = vertcat(A(nz,i), zeros(N-length(nz),1));%We shift all nonzero elements to the left.
        end
    end
end

%% 3: Swipe RIGHT
if m == 3
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
end

%% 4: Swipe DOWN
if m == 4
    %Stage I: swipe
    for i = 1:N
        nz = find(A(:,i)~=0);                                %Check which elements are nonzero.
        if length(nz) ~= N                                   %Only shift if a row contains zeros.
            A(:,i) = vertcat(zeros(N-length(nz),1), A(nz,i));%We shift all nonzero elements to the left.
        end
    end
    
    %Stage II: merge and score
    for i = N:-1:2
        for j = 1:N
            if A(i,j) == A(i-1,j)                            %Check if two neighbours have the same value
                A(i-1,j) = 2*A(i,j);                         %If so, merge them
                A(i,j) = 0;                                  %Remove the value that just merged
                s = s+A(i-1,j)/2;                            %Add the score
            end
        end
    end
    
    %Stage III: swipe again
    for i = 1:N
        nz = find(A(:,i)~=0);                                %Check which elements are nonzero.
        if length(nz) ~= N                                   %Only shift if a row contains zeros.
            A(:,i) = vertcat(zeros(N-length(nz),1), A(nz,i));%We shift all nonzero elements to the left.
        end
    end
end




