f = @(x,y) x + y;

yAB = @(x) 2*x - 1;
yBC = @(x) -x + 5;
yAC = @(x) 1/2*x + 1/2;

xspan = [0.5, 3.5];
figure(1);clf;
hold on; grid on;
fplot(yAB,xspan);
fplot(yBC,xspan);
fplot(yAC,xspan);

figure(2);clf;
hold on; grid on;
X = [1,2,3];
Y = [1,3,2];
fill(X,Y,'b');

