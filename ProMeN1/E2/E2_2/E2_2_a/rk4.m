function [t,y] = rk4(f,a,b,y0,n)
  t = zeros(n+1,1);t(1) = a;
  y = zeros(n+1,length(y0));y(1,:)= y0; 
  h =(b-a)/n;
  for k = 1:n
    t(k+1) = t(k) + h;
    K1 = h*feval(f,t(k),y(k,:));
    K2 = h*feval(f,t(k)+h/2,y(k,:)+ K1/2);
    K3 = h*feval(f,t(k)+h/2,y(k,:)+ K2/2);
    K4 = h*feval(f,t(k)+h,y(k,:)+ K3);
    y(k+1,:) = y(k,:)+ (K1+2*K2+2*K3+K4)/6;
  end
end