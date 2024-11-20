function q = ExactIntegralValue(f)
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja oblicza analitycznie dokładną wartość całki podwójnej z funkcji 
% f na obszarze D za pomocą Symbolic Math Toolbox.
% Funkcja przyjmuje jeden argument: 
% f - uchwyt do funkcji podcałkowej
% Obszar D jest dzielony na dwa trójkąty:
% 1) lewy, ograniczony przez y = -x-1, y = x+1, x = 0
% 2) prawy, ograniczony przez y = x-1, y = -x+1, x = 0

syms x y
f = f(x, y);
qleft = int(int(f,y,-x-1,x+1),-1,0);
qright = int(int(f,y,x-1,-x+1),0,1);
q = qleft+qright;

end