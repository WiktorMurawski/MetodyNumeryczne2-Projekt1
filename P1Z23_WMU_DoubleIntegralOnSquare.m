function q = P1Z23_WMU_DoubleIntegralOnSquare(f,n)
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja P1Z23_WMU_DoubleIntegralOnSquare wyznacza przybliżenie całki
% podwójnej z funkcji f(x,y) na obszarze D = {(x,y):|x|+|y|<= 1}
% poprzez podział obszaru na 4n^2 trójkątów przystających i zastosowanie na
% każdym z nich kwadratury Gaussa rzędu drugiego
% Funkcja przyjmuje dwa argumenty:
% f - uchwyt do funkcji podcałkowej
% n - liczba całkowita wyznaczająca ilość trójkątów, na jakie podzielony
% będzie obszar; obszar dzielony jest na 4n^2 trójkątów

if nargin < 2
  n = 1;
end
if nargin < 1
  f = @(x,y) 0;
end

P = 0.5/n/n;% Pole każdego z trójkątów
q = 0; % Inicjalizacja wartości całki
for x = 0:n-1
  r = 1;
  for y = [repelem(0:n-x-2,2) n-x-1]
    r = not(r);
    % Wyznaczamy współrzędne wierzchołków trójkątów w ćwiartce pierwszej
    % W pierwszej kolumnie przechowywane są kolejno x1,x2,x3
    % W drugiej kolumnie przechowywane są kolejno y1,y2,y3
    vertices = [
      (x+r)/n, (y+r)/n;
      (x+1)/n, y/n;
      x/n, (y+1)/n; 
      ];

    % Przekład trójkątów na II, III i IV ćwiartkę
    triangles = {
      vertices; % I ćwiartka
      [-vertices(:,1), vertices(:,2)]; % II ćwiartka
      [-vertices(:,1), -vertices(:,2)]; % III ćwiartka
      [vertices(:,1), -vertices(:,2)]; % IV ćwiartka
      };

    % Zastosowanie kwadratury na każdym z 4 trójkątów
    for k = 1:length(triangles)
      t = triangles{k};
      q = q+KwadraturaSW(f, ...
        t(1,1), t(1,2), t(2,1), t(2,2), t(3,1), t(3,2), P);
    end % for k
  end % for y
end % for x

end % function