function [] = numtest1()
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja testująca własności numeryczne zaimplementowanej metody
% Funkcja testuje metodę na kilku funkcjach dwóch zmiennych, które nie są
% wielomianami stopnia < 2
% Funkcja porównuje wynik uzyskany za pomocą funkcji 
% MatlabDoubleIntegralValue (która wykorzystuje wbudowaną funkcję
% integral2) z wynikami uzyskanymi zaimplementowaną metodą 

% Wartości n
nValues = [1,5,10,50,100,500];
n = length(nValues);

% Testowane funkcje
functions = {
  @(x,y) (x+y)^2;
  @(x,y) (x+y)^4;
  @(x,y) (x*y)/(2+x+y);
  @(x,y) exp(x*y);
  @(x,y) sqrt(2*x^2 + y^2);
  @(x,y) 1/sqrt(x^2 + y^2 + 1);
  };
N = numel(functions);

fNames = strings(N,1);
exactValues = zeros(N,1);
results = zeros(N,n);

% Testowanie metody
fprintf("Testy numeryczne...")
for i = 1:N
  fprintf(".")
  f = functions{i};
  cleanName = regexprep(func2str(f), '^@\([^\)]*\)\s*', '');
  fNames(i) = cleanName;
  f = @(x,y) arrayfun(f,x,y);
  exactValues(i) = MatlabDoubleIntegralValue(f);
  for j = 1:n
    results(i,j) = P1Z23_WMU_DoubleIntegralOnSquare(f,nValues(j));
  end
end

% Obliczanie błędów
absErr = zeros(N,n);
relErr = zeros(N,n);
for i = 1:n
  absErr(:,i) = abs(exactValues-results(:,i));
  relErr(:,i) = absErr(:,i)./exactValues;
end

fNames = repelem(fNames,n);
exactValues = repelem(exactValues,n);
nValues = repmat(nValues,1,N)';
exactValues = exactValues';
exactValues = exactValues(:);
results = results';
results = results(:);
absErr = absErr';
absErr = absErr(:);
relErr = relErr';
relErr = relErr(:);

width = 75;
line = [repmat('-', 1, width), newline];
fprintf("\n%s",line);

% Wypisywanie tabeli
fprintf("%-18s  %-11s %-5s  %-11s  %-11s  %-11s\n","f(x,y) = ",...
  "wynik z","n","wynik","błąd","błąd");
fprintf("%-18s  %-11s %-5s  %-11s  %-11s  %-11s\n","",...
  "integral2","","uzyskany","bezwzględny","względny");
fprintf("%s",line);
for i = 1:length(results)
  fprintf("%-16s  %12.4e  %-3d %12.4e %12.4e %12.4e\n",fNames(i),...
    exactValues(i),nValues(i),results(i),absErr(i),relErr(i));
  if 0 == mod(i,n)
    fprintf("%s",line);
    pause()
  end
end

end % function