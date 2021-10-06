w=5;
g=10;
R=1;
a=0;
b=30;
N=1000;
v0=0;
th0=0.5;

f=@(t,X) [X(2), (w^2)*cos(X(1))*sin(X(1))-(g/R)*sin(X(1))]
[t,X] = rk4(f,a,b,[th0,v0],N);

figure(1)
subplot(2,1,1),plot(t,X(:,1),'linewidth',2),xlabel('tiempo'),ylabel('posicion angular')
periodo(X(:,1), (b-a)/N)