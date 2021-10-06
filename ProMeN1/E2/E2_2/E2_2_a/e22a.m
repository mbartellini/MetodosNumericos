w=5;
g=10;
R=1;
a=0;
b=30;
N=20000;
v0=0;
th0=0.1;

f=@(t,X) [X(2), (w^2)*cos(X(1))*sin(X(1))-(g/R)*sin(X(1))]
[t,X] = rk4(f,a,b,[th0,v0],N);

figure(1)
subplot(2,2,1),plot(t,X(:,1),'linewidth',2),xlabel('tiempo'),ylabel('posicion angular')
subplot(2,2,2),plot(t,X(:,2),'linewidth',2),xlabel('tiempo'),ylabel('velocidad angular')
subplot(2,2,3),plot(X(:,1),X(:,2),'linewidth',2),xlabel('posicion angular'),ylabel('velocidad angular')
subplot(2,2,4),plot3(t,X(:,1),X(:,2),'linewidth',2)

E=(v0^2) - 2*(g/R)*cos(th0)- (w^2)*(sin(th0))^2
Err=[];

for j=1:length(X)
  Err=[Err; abs((X(j,2)^2) - 2*(g/R)*cos(X(j,1))- (w^2)*(sin(X(j,1)))^2 - E)];
end 

max(Err)/10^(-5)

cartesians=[];

for j=1:length(X)
  time=t(j);
  cartesians=[cartesians; sin(X(j,1))*cos(w*time), sin(X(j,1))*sin(w*time), 1-cos(X(j,1))];
end

figure(2)
subplot(2,2,1),plot(cartesians(:,2),cartesians(:,3),'linewidth',2)
subplot(2,2,2),plot(cartesians(:,1),cartesians(:,2),'linewidth',2)
subplot(2,2,3),plot(cartesians(:,1),cartesians(:,3),'linewidth',2)
subplot(2,2,4),plot3(cartesians(:,1),cartesians(:,2),cartesians(:,3),'linewidth',2)

figure(3)
subplot(2,2,1),plot(cartesians(:,1),'linewidth',2)
subplot(2,2,2),plot(cartesians(:,2),'linewidth',2)
subplot(2,2,3),plot(cartesians(:,3),'linewidth',2)