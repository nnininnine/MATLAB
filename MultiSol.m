function [A_out] = MultiSol(A)
    [m,n] = size(A);
    if m < n-1
       A = [A;zeros([n-1-m,n])]; 
    end
    %A = gauss_jordan_unb(A);
    A = gauss_jordan_loop(A);
    [m,n] = size(A);
    j = 0;
    k = 0; 
    Xs = [];
    Xn = [];
    free_var = [];
    index = [];
    for i = 1:m
        if A(i,:) == zeros(size(A(i,:)))
            A(i,i) = 1;
            free_var(j+1) = i;
            j = j + 1;
        else
            index = [index ; A(i,:)];
            k = k + 1;
        end
    end
    eqn = A(:,(1:m));
    ans = A(:,n);
    %Xs = gauss_jordan_unb([eqn ans]);
    Xs = gauss_jordan_loop([eqn ans]);
    Xs = Xs(:,n);
    for i = 1:j
        ans = zeros(size(ans));
        while ans == zeros(size(ans))
            for k = 1:j
                ans(free_var(i)) = randi(2,1) - 1;
            end
        end
        %tmp2 = gauss_jordan_unb([eqn ans]);
        tmp2 = gauss_jordan_loop([eqn ans]);
        Xn = [Xn tmp2(:,n)];
    end
    A_out = [Xs Xn];
    