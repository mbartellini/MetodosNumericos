clear;

Ti=0; Yi=-3; Tf=5;
f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;

# Runge-Kutta de orden 4
H=[]; E=[]; Yrk4=[];
for r=2:9
    N=2^r;
    [t1,y1]=rk4(f,Ti,Tf,Yi,N);
    [t2,y2]=rk4(f,Tf,Ti,y1(end),N);    
    Yrk4=[Yrk4; y2(end)];
    E=[E; abs(Yi - Yrk4(end))];
    H=[H;(Tf-Ti)/N];
end
[Yrk4,H,E]
