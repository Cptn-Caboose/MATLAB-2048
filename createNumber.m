function [i,j,val] = createNumber(N)
        i = ceil(rand*N);
        j = ceil(rand*N);
        val = rand;
        if val < 0.9
            val = 2;
        else
            val = 4;
        end
end