function [x,timeVal] = gauss_jordan_inv(a)
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
time = tic;
[m,n]=size(a);
a(:, n+1:n+3) = eye(3);
[m,n]=size(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            t=a(1,:);a(1,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end

for j=m:-1:2
    for i=j-1:-1:1
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
for s=1:m
    a(s,:)=a(s,:)/a(s,s);
end
x = [a(:,(4:6))];
timeVal = toc(time);

end