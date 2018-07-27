function x_hat = OMP(A,y,k)

%initialize counter, index set/support, guess, residual 
t=0; S=[]; x_hat=zeros(size(A,2),1); res=A*x_hat - y;

%iterate until desired threshold
while abs(res)>10e-15 & t<=k
    lambda = 1; %initialize column index
    for j=1:size(A,2) %iterate through column of A
        if abs(dot(res,A(:,lambda))) < abs(dot(res,A(:,j))) %identify the column index with max contribution 
            lambda = j;
        end
    end
    S = [S lambda]; %update index set
    x_hat(S)=A(:,S)\y; %solve the least squares problem to obtain new signal 
    res = y - A*x_hat; %update the residual 
    t = t+1; %increment counter 
end

x_hat;
A(:,S);
norm(A*x_hat-y,2);
size(x_hat);
% plot(1:size(A,2),x,'ro-')
% hold on
% plot(1:size(A,2),x_hat,'bo-')
y;
end

