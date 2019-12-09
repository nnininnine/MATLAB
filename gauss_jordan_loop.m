function [A_out] =  gauss_jordan_loop(A)
    dim = size(A);
    
    for i = 1:dim(1)
        if not (A(i,i) == 0 && isequal(A(i+1:dim(1),i),zeros(size(A(i+1:dim(1),i)))))
            while  A(i,i) == 0
                temp = A(i,:);

                A(i,:) = A(i+1,:);

                A(i+1,:) = temp;

            end
            if i+1 <= dim(1)
                l =  A(i+1:dim(1),i);
                l = -l/A(i,i);
                A(i+1:dim(1),i+1:dim(2)) = A(i+1:dim(1),i+1:dim(2)) + l*A(i,i+1:dim(2));
                A(i+1:dim(1),i) = zeros(size( A(i+1:dim(1),i)));
            end
            if i-1 >= 1
                u = A(1:i-1,i);
                u = -u/A(i,i);
                A(1:i-1,i+1:dim(2)) = A(1:i-1,i+1:dim(2)) +  u*A(i,i+1:dim(2));
                A(1:i-1,i) = zeros(size(A(1:i-1,i)));
            end
        end
    end
    
    A_out = A;
    [m,n] = size(A);
      for i = 1:m
         if not (A_out(i,i) == 0)
            A_out(i,:) = A_out(i,:)/A_out(i,i); 
         end
      end
return