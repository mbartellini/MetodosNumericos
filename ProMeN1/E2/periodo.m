function p = periodo(r,h)
  % r es un ve tor on las posi iones y
  % h es el paso de tiempo entre valores de r
  T=[];r = r-mean(r);
  for k = 1:length(r)-1
    if r(k+1)*r(k)<0
      T = [T;k*h];
  end
end
T=T(1:2:end);
p=mean(diff(T));