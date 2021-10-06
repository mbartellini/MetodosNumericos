clear;

Ti=0; Yi=-3; Tf=5;
f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;

# Runge-Kutta de orden 4
H=[]; E=[]; Yrk4=[];
for r=2:9
    N=2^r;
    [t,y]=rk4(f,Ti,Tf,Yi,N);
    Yrk4=[Yrk4; y(end)];
    E=[E; abs(sol(Tf) - Yrk4(end))];
    H=[H;(Tf-Ti)/N];
end
printf("RK");
[Yrk4,H,E]

# Metodo de Heun
H=[]; E=[]; Yheun=[];
for r=2:9
    N=2^r;
    [t,y]=heun(f,Ti,Tf,Yi,N);
    Yheun=[Yheun; y(end)];
    E=[E; abs(sol(Tf) - Yheun(end))];
    H=[H;(Tf-Ti)/N];
end
printf("Heun");
[Yheun,H,E]