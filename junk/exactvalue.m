syms x y f(x, y)

% Define the function to integrate
a = 1;
b = 0;
c = 1;
f(x, y) = @(x,y) a*x + b*y + c; % Replace with your function

left_integral = int(int(f,y,-x-1,x+1),x,-1,0)
right_integral = int(int(f,y,x-1,-x+1),x,0,1)

f(x,y) = x
idy = int(f,y,0,-x)
i = int(idy,x,0,1)