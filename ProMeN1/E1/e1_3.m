# Representación gráfica de los errores globales en t = t_f
clear;

Ti=0; Yi=-3; Tf=5;
f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;

H=[];
Yrk4=[]; Erk4=[];
Yheun=[]; Eheun=[];

for r=2:9
    N=2^r;
    H=[H; (Tf-Ti)/N];
    
    [t,y]=rk4(f,Ti,Tf,Yi,N);
    Yrk4=[Yrk4; y(end)];
    Erk4=[Erk4;abs(sol(Tf)-y(end))];
    
    [t,y]=heun(f,Ti,Tf,Yi,N);
    Yheun=[Yheun; y(end)];
    Eheun=[Eheun;abs(sol(Tf)-y(end))];
end
figure(1)
loglog(H,Erk4,"-x;Runge-Kutta;",H,Eheun,"-o;Heun;")
xlabel("Paso h");ylabel("Error global en Tf");
legend ("location", "southeast");

[H, log(Erk4), log(Eheun)]

CocIncrk4 = diff(log(Erk4)) ./ diff(log(H));
CocIncheun = diff(log(Eheun)) ./ diff(log(H));

figure(2)
plot(CocIncrk4, "-x;Runge-Kutta;", CocIncheun, "-o;Heun;");
grid on;
xlabel("r=log2(T/h)"); 
ylabel("Coeficiente incremental")