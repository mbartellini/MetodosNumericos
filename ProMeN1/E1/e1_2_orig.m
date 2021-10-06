f=@(t,y) ((-2)*y/(1+t))+exp(t)/((1+t)^2);
sol=@(t) (-4 + exp(t))*(1+t)^-2;
T=5; H=[]; E=[]; Y1=[];
for r=2:9
    N=2^r;
    [t,y1]=rk4(f,0,T,-3,N);
    Y1=[Y1; y1(end)];
    E=[E; abs(sol(5) - y1(end))];
    H=[H;T/N];
end

T=5; H=[]; E=[]; Y3=[];
for r=2:9
    N=2^r;
    [t,y3]=rk4(f,T,0,Y1(r-1),N);
    Y3=[Y3; y3(end)];
    E=[E; abs(sol(0) - y3(end))];
    H=[H;T/N];
end
[Y3,H,E]