function [A_out] = lowerMatrix(A)
    [m,n] = size(A);
    if m == n
        for i = 1:m
            for j = 1:n
                if i < j
                    A(i,j) = 0;
                end
            end
        end 
    else
        A_out = 'FAILED';
    end
    A_out = A;