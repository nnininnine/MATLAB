function [ b ] = Prob_unb_var2( A, b, c )
    for i = 1:c
       b = A*b;
    end
return