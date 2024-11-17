function q = ExactIntegralValue(f)

syms x y
f = f(x, y);
qleft = int(int(f,y,-x-1,x+1),-1,0);
qright = int(int(f,y,x-1,-x+1),0,1);
q = qleft + qright;

end