function q = IntegralOnTriangleSW(f,x1,y1,x2,y2,x3,y3)
% Zadanie P1
% Wiktor Murawski, 333255
%
% Funkcja integralOnTriangle przybliża całkę podwójną na obszarze D
% wyznaczonym przez trójkąt o wierzchołkach (x1,y1),(x2,y2),(x3,y3)
% Funkcja przyjmuje jako pierwszy argument uchwyt do funkcji dwóch
% zmiennych, następnymi argumentami są kolejno x1,y1,x2,y2,x3,y3, gdzie
% (x1,y1),(x2,y2),(x3,y3) są wierzchołkami trójkąta będącego obszarem D
% Do przybliżenia całki funkcja korzysta z kwadratury prostej rzędu 2-go
f
X=[x1,x2,x3];
Y=[y1,y2,y3];
fill(X,Y,'c');

% Tworzymy macierz A do wyznaczenia pola trójkąta
A = [1,1,1;x1,x2,x3;y1,y2,y3]

% Wyznaczamy pole trójkąta
P = 0.5*abs(det(A))

% Korzystamy z formuły rzędu 2 (SW)
q = P/3*(f(x1,y1) + f(x2,y2) + f(x3,y3))

% x123 = (x1 + x2 + x3)/3
% y123 = (y1 + y2 + y3)/3
% qSS = P*f((x1+x2+x3)/3,(y1+y2+y3)/3)





end % function