function [] = numtest2()
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja testująca własności numeryczne zaimplementowanej metody
% Funkcja testuje metodę na kilku funkcjach dwóch zmiennych stopnia > 1
% Funkcja porównuje wynik uzyskany za pomocą funkcji 
% MatlabDoubleIntegralValue (która wykorzystuje wbudowaną funkcję
% integral2) z wynikami uzyskanymi zaimplementowaną metodą 
% dla n = 50, n = 100, n = 500
% Funkcja różni się od funkcji numtest1 tylko wartościami n

% Testowane funkcje
functions = {
  @(x,y) (x+y)^2;
  @(x,y) sin(x) + cos(y);
  @(x,y) exp(x)^exp(y);
  @(x,y) sqrt(x*y)
  @(x,y) (x*y)/(2+x+y)
  };
N = numel(functions);

functionNames = strings(N,1);
exactValues = zeros(N,1);
n = [50,100,500];
results = zeros(N,3);

for i = 1:N
  f = functions{i};
  cleanName = regexprep(func2str(f), '^@\([^\)]*\)\s*', '');
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
width = 75-2;
line = [repmat('-', 1, width), newline];
neq = "    n = ";

fprintf("%-20s| %-11s|%5s%-33s|\n", ...
  "Funkcja","Wynik","","Wyniki uzyskane przez metodę")
fprintf("%-20s| %-11s|%-12s|%-12s|%-12s|\n", ...
  "f(x,y) = ","Dokładny",neq+n(1),neq+n(2),neq+n(3))
fprintf("%s",line);

for i = 1:N
  fprintf("%-20s|%11.4e |%11.4e |%11.4e |%11.4e |\n", ...
    functionNames(i),exactValues(i), ...
    results(i,1),results(i,2),results(i,3));
  fprintf("%s",line);
end

disp('Naciśnij dowolny klawisz aby kontynuować...');
pause('on'); % Enable waiting for user input
pause; % Waits until the user presses any key
fprintf("%s",line);

fprintf("%-20s| %-11s|%7s%-31s|\n", ...
  "Funkcja","Wynik","","Błędy bezwzględne metody")
fprintf("%-20s| %-11s|%-12s|%-12s|%-12s|\n", ...
  "f(x,y) = ","Dokładny",neq+n(1),neq+n(2),neq+n(3))
fprintf("%s",line);

for i = 1:N
  fprintf("%-20s|%11.4e |%11.4e |%11.4e |%11.4e |\n", ...
    functionNames(i),exactValues(i), ...
    err(i,1),err(i,2),err(i,3));
  fprintf("%s",line);
end

end % function