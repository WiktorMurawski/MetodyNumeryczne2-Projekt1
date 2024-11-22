function [] = PlotError(f,n1,n2,step) 
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja przyjmuje cztery argumenty:
% f - uchwyt do funkcji dwóch zmiennych, domyślnie f = @(x,y) (x+y).^2
% n1 - najniższe n, dla którego wyznaczony zostanie błąd, domyślnie 1
% n2 - najwyższe n, dla którego wyznaczony zostanie błąd, domyślnie 100
% step - krok, co ile będzie zmieniać się n, domyślnie 1
% Funkcja tworzy wykres |I(f) - S(f)|, gdzie I(f) jest wartością całki
% podwójnej na D z f, a S(f) jest aproksymacją całki podwójnej na D z f,
% wyznaczoną funkcją P1Z23_WMU_DoubleIntegralOnSquare

p = 3;

if nargin < 1
  f = @(x,y) (x+y).^p;
end
if nargin < 2
  n1 = 1;
  n2 = 100;
end
if nargin < 3
  n2 = n1;
  n1 = 1;
end
if nargin < 4
  step = 1;
end

range = n1:step:n2;
exactValue = MatlabDoubleIntegralValue(f);
err = zeros(1,length(range));
for i = 1:length(range)
  n = range(i);
  fprintf("n = %d\n",n);
  err(i) = abs(exactValue - P1Z23_WMU_DoubleIntegralOnSquare(f,n));
end % for i

figure(1);
clf;
hold on;
xlabel("n")
legend;
plot(range,err,"DisplayName","Błąd bezwzględny");
plot(range,300*range.^(-p),"DisplayName","n^{-p}");


end % function