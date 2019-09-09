function [y_out] = laff_copy(x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [r1,c1] = size(x);,[r2,c2] = size(y);
    if r1 == 1 | c1 == 1
        if r2 == 1 | c2 == 1
            if size(x) == size(y)
                y_out = x;
            elseif size(x) == size(y')
                y_out = x';
            else
                y_out = 'FAILED';
            end
        else
            y_out = 'FAILED';
        end
    else
        y_out = 'FAILED';
    end
        
end

