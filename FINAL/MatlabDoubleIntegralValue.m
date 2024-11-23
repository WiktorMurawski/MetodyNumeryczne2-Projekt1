function q = MatlabDoubleIntegralValue(f,tol)
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja oblicza wartość całki podwójnej z funkcji f na obszarze D 
% za pomocą wbudowanej funkcji integral2
% Funkcja przyjmuje dwa argumenty:
% f - uchwyt do funkcji podcałkowej
% tol - tolerancja funkcji integral2, domyślnie tol = 1e-15
% Obszar D jest dzielony na dwa trójkąty:
% 1) lewy, ograniczony przez y = -x-1, y = x+1, x = 0
% 2) prawy, ograniczony przez y = x-1, y = -x+1, x = 0

if nargin < 2
  tol = 1e-15;
end

% Przekształcenie uchwytu funkcji tak, żeby operatory w niej zawarte
% działały na elementach tablicy
f = @(x,y) arrayfun(f,x,y);

% Obliczenie całki na lewym trójkącie
qleft = integral2(f,-1,0,@(x) -x-1,@(x) x+1,'AbsTol',tol,'RelTol',tol);

% Obliczenie całki na prawym trójkącie
qright = integral2(f,0,1,@(x) x-1,@(x) -x+1,'AbsTol',tol,'RelTol',tol);

% Zsumowanie obu całek
q = double(qleft + qright);

end