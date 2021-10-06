f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;

T=5; TRANGE=[0,5];
ErrGlobal=odeset("AbsTol", 1e-3);

[tode45, yode45]=ode45(f, TRANGE, -3, ErrGlobal);
plot(tode45, yode45,'-o'); xlabel("t"); ylabel("Aproximacion 
    de ode45 siguiendo el metodo de Dormand-Prince");
plot(tode45,'-o');grid on;ylabel("t");

V=[];
for i=2:length(tode45)
    V=[V;tode45(i)-tode45(i-1)];
end

max(v)
min(v)
plot(v);grid on;ylabel("Paso h");