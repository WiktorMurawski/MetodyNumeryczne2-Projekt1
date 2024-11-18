function q = MatlabDoubleIntegralValue(f)
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja oblicza analitycznie dokładną wartość całki podwójnej z funkcji 
% f na obszarze D za pomocą wbudowanej funkcji integral2
% Funkcja przyjmuje jeden argument: 
% f - uchwyt do funkcji podcałkowej
% Obszar D jest dzielony na dwa trójkąty:
% 1) lewy, ograniczony przez y = -x-1, y = x+1, x = 0
% 2) prawy, ograniczony przez y = x-1, y = -x+1, x = 0

% Obliczenie całki na lewym trójkącie
qleft = integral2(f, -1, 0, @(x) -x-1, @(x) x+1);

% Obliczenie całki na prawym trójkącie
qright = integral2(f, 0, 1, @(x) x-1, @(x) -x+1);

q = qleft + qright;

end