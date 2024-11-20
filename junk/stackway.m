% Define a function to integrate.
% This function takes an nx2 array, where each row
% contains a single point to evaluate the kernel at.
% This computes x^2 + y^2 at each point.
fun = @(xy) sum(xy.^2,2);

% define the domain as a triangulated polygon
% this tool uses ear clipping to do so.
x1 = 1; y1 = 1;
x2 = 2; y2 = 3;
x3 = 3; y3 = 2;

sc = poly2tri([x1 x2 x3],[y1 y2 y3]);

% Gauss-Legendre integration over the 2-d domain
[integ,fev] = quadgsc(fun,sc,2)
% integ =
%        113.166666666667
% fev =
%      8

% the triangulated polygon...
plotsc(sc,'facecolor','none','markerfacecolor','r')
axis equal
grid on