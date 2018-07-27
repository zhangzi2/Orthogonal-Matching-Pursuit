
% fixed parameters
N=1000;
s=20;
x=zeros(N,1);
supp = randsample(N, s); 
x(supp) = randn(s,1);


% varied rows
rows=10:10:200;
err1=zeros(length(rows),1);
err2=zeros(length(rows),1);
for j=1:length(rows)
    % uniformly distributed matrix
    A1=rand(rows(j),N);
    y1=A1*x;
    x_star1=OMP(A1,y1,s);
    err1(j)=abs(norm(x-x_star1,2));
    % normally distributed matrix
    A2=randn(rows(j),N);
    y2=A2*x;
    x_star2=OMP(A2,y2,s);
    err2(j)=abs(norm(x-x_star2,2));
end

plot(rows,err1,'-+r',rows, err2, '-ob');hold on;
title('Varying Rows');
xlabel('Number of Rows');
ylabel('2-Norm of Errors');
legend('Uniformly Distributed Matrix','Normally Distributed Matrix');

%{
% fixed parameters
N=1000;
m=200;
A1=rand(m,N);
A2=randn(m,N);
x=zeros(N,1);

% varied sparsity
sparsity=0:10:100;
err1=zeros(length(sparsity),1);
err2=zeros(length(sparsity),1);
for j=1:length(sparsity)
    x=zeros(N,1);

    supp=randsample(N,sparsity(j));
    x(supp)=randn(sparsity(j),1);
    
    % uniformly distributed matrix
    y1=A1*x;
    x_star1=OMP(A1,y1,sparsity(j));
    err1(j)=abs(norm(x-x_star1,2));
    % normally distributed matrix
    y2=A2*x;
    x_star2=OMP(A2,y2,sparsity(j));
    err2(j)=abs(norm(x-x_star2,2));
end

plot(sparsity,err1,'-+r',sparsity, err2, '-ob');hold on;
title('Varying Sparsity');
xlabel('Sparsity');
ylabel('2-Norm of Errors');
legend('Uniformly Distributed Matrix','Normally Distributed Matrix');
%}
