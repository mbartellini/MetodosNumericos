clear;

TRANGE=[0,5]; Yi=-3;
ErrGlobal=odeset("AbsTol", 1e-3);
f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;

[tode45, yode45]=ode45(f, TRANGE, Yi, ErrGlobal);
figure(1)
plot(tode45, yode45,'-o');
grid on;
xlabel("t");
ylabel("Aproximación de ode45 según método de Dormand-Prince");

figure(2)
plot(tode45,'-o');
grid on;
xlabel("i")
ylabel("t_i");

max(diff(tode45))
min(diff(tode45))
figure(3)
plot(diff(tode45));
grid on;
xlabel("i");
ylabel("h_i");