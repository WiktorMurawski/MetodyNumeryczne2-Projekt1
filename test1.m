function [] = test1()
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja testująca poprawność zaimplementowanej metody
% Funkcja testuje metodę na kilku funkcjach dwóch zmiennych stopnia <= 1
% Funkcja podaje wynik dokładny uzyskany za pomocą Symbolic Math Toolbox
% oraz wyniki uzyskane zaimplementowaną metodą dla n = 1, n = 10, n = 100

% Testowane funkcje
functions = {
  @(x,y) 0;
  @(x,y) x+y;
  @(x,y) 1;
  @(x,y) x + y + 1;
  @(x,y) 3.14*x + 2.72*y + 1.62;
  @(x,y) 0.05*x + 0.01*y + pi;
  };
N = numel(functions);

functionNames = strings(N,1);
exactValues = zeros(N,1);
n = [1,10,100];
results = zeros(N,3);

for i = 1:N
  f = functions{i};
  cleanName = regexprep(func2str(f), '^@\([^\)]*\)\s*', '');
  %functionNames(i) = "f(x,y)="+cleanName;
  functionNames(i) = cleanName;
  exactValues(i) = ExactIntegralValue(f);
  for j = 1:3
    results(i,j) = P1Z23_WMU_DoubleIntegralOnSquare(f,n(j));
  end
end

err = zeros(N,3);

err(:,1) = abs(exactValues-results(:,1));
err(:,2) = abs(exactValues-results(:,2));
err(:,3) = abs(exactValues-results(:,3));

% Wyświetlanie
width = 75;
fprintf("%-20s|%12s|%12s|%12s|%12s|\n", ...
  "Funkcja","Wynik","n="+n(1),"n="+n(2),"n="+n(3))
for j = 1:width-2
  fprintf("-")
end
fprintf("\n")
for i = 1:N
  fprintf("%-20s|%12g|%12g|%12g|%12g|\n", ...
    "f(x,y) = ",exactValues(i),results(i,1),results(i,2),results(i,3));
  fprintf("%-20s|%12g|%12g|%12g|%12g|\n", ...
    functionNames(i),'',err(i,1),err(i,2),err(i,3));
  for j = 1:width-2
    fprintf("-")
  end
  fprintf("\n")
end

end % function