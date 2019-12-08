function A = myrref(A)

[m,n]=size(A);

for j=1:m

    A(j,:) = A(j,:)/A(j,j);

    for i = 1:n
        if j < i
        A(i,:)= A(i,:)- A(j,:)*A(i,j);
        end
    end
    for j=1:min(m,n)
        A(j,:) = A(j,:)/A(j,j);
        for i = j+1:m
            A(i,:)= A(i,:)- A(j,:)*A(i,j);
        end
    end
end