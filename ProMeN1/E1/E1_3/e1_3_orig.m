# Representación gráfica de los errores globales en t = t_f

T=5; H1=[]; E1=[]; Y1=[]; H2=[]; E2=[]; Y2=[];
for r=2:9
    N=2^r
    [t,y1]=rk4(f,0,T,-3,N); 
    [t,y2]=heun(f,0,T,-3,N); 
    Y1=[Y1; y1(end)];
    E1=[E1;abs(sol(5)-y1(end))];
    H1=[H1;T/N];
    Y2=[Y2; y2(end)];
    E2=[E2;abs(sol(5)-y2(end))];
    H2=[H2;T/N];
end
loglog(H2,E2,"-x;Runge-Kutta;",H1,E1,"-o;Heun;")
xlabel("Step h");ylabel("Error global");
legend ("location", "southeast");

# h = T/2^r
V=[];
for i=2:8
    aux=(log(E2(i))-log(E2(i-1)))/(log(H2(i))-log(H2(i-1)));
    V=[V;aux]
end
plot(2:8,V); grid on; xlabel("r=log2(T/h)"); 
ylabel("Coeficiente incremental")