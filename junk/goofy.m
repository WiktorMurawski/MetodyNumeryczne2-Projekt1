syms x y f(x,y) 
syms a b c

f(x,y) = a*x + b*y + c;

% I1dx = int(f,y-1,y+1)
% I1dxdy = int(I1dx,-1,1)
% 
% I2dx = int(f,y-1,y+1)
% I1dxdy = int(I1dx,-1,1)

%I1 = int(int(f,y,x-1,-x+1),0,1)
%I2 = int(int(f,y,-x-1,x+1),-1,0)

%int(int(f,y,x-1,-x+1),0,1)

pretty(f)
I1dy = expand(int(f,y,-x-1,x+1));
pretty(I1dy)
I1 = expand(int(I1dy,x,-1,0));
pretty(I1)

I1_s = expand(int(I1dy,x))

subs(I1_s,x,-1)
