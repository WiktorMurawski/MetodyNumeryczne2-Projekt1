function q = QuadratureSS(f,x1,y1,x2,y2,x3,y3,P)
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja QuadratureSW przybliża całkę podwójną na obszarze
% wyznaczonym przez trójkąt o wierzchołkach (x1,y1),(x2,y2),(x3,y3) przy
% użyciu kwadratury prostej rzędu 2-go w notatkach dr Wróbel oznaczonej 
% jako kwadratura SS
% Jako pierwszy argument funkcja przyjmuje uchwyt do funkcji dwóch 
% zmiennych
% Następnymi argumentami są kolejno x1, y1, x2, y2, x3, y3, gdzie
% (x1,y1), (x2,y2) i (x3,y3) są wierzchołkami trójkąta będącego obszarem,
% na którym stosujemy kwadraturę
% Ostatni argument P jest opcjonalny i oznacza on pole trójkąta, na którym
% stosujemy kwadraturę. Jeśli nie jest podany, to funkcja sama go wyliczy.

if nargin < 8
  % Tworzymy macierz A do wyznaczenia pola trójkąta
  A = [1,1,1;x1,x2,x3;y1,y2,y3];
  % Wyznaczamy pole trójkąta
  P = 0.5*abs(det(A));
end

% Korzystamy z formuły rzędu 2-go (SS)
q = P*f((x1+x2+x3)/3,(y1+y2+y3)/3);

end % function