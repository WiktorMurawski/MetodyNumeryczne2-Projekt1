function [] = test1()
% Projekt 1, Zadanie 23
% Wiktor Murawski, 333255
%
% Funkcja testująca poprawność zaimplementowanej metody
% Funkcja testuje metodę na kilku wielomianach dwóch zmiennych stopnia < 2
% Funkcja porównuje wynik uzyskany za pomocą funkcji
% MatlabDoubleIntegralValue (która wykorzystuje wbudowaną funkcję
% integral2) z wynikami uzyskanymi zaimplementowaną metodą

fprintf("Program testujący poprawność metody.\n")
fprintf("Wszystkie funkcje, na których testowana jest metoda,\n")
fprintf("są postaci f(x,y) = ax + by + c, ")
fprintf("gdzie a,b,c są rzeczywiste.\n")
fprintf("Wynik dokładny całki podwójnej z f na D to zawsze 2c.\n")
fprintf("Dla każdej funkcji f testowana jest metoda dla " + ...
  "n = 1,5,10,50,100,500\n")
fprintf("Po wypisaniu części wyników program " + ...
  "czeka na dowolny znak z klawiatury.\n")
fprintf("\n")

% Wartości n
nValues = [1,5,10,50,100,500];
n = length(nValues);

e = exp(1);
% Testowane funkcje
functions = {
  @(x,y) 1;
  @(x,y) x+y+1;
  @(x,y) 8*x+2*y+1/2;
  @(x,y) x-y+sqrt(2);
  @(x,y) -x+2*y-pi;
  @(x,y) pi*x - e*y;
  };
N = numel(functions);

fNames = strings(N,1);
exactValues = zeros(N,1);
results = zeros(N,n);

fprintf("Testowanie...")
for i = 1:N
  fprintf(".");
  f = functions{i};
  cleanName = regexprep(func2str(f), '^@\([^\)]*\)\s*', '');
  fNames(i) = cleanName;
  exactValues(i) = 2*f(0,0);
  for j = 1:n
    results(i,j) = P1Z23_WMU_DoubleIntegralOnSquare(f,nValues(j));
  end
end

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

fprintf("%-18s  %-11s %-5s  %-11s  %-11s  %-11s\n","f(x,y) = ",...
  "wynik","n","wynik","błąd","błąd");
fprintf("%-18s  %-11s %-5s  %-11s  %-11s  %-11s\n","",...
  "dokładny","","uzyskany","bezwzględny","względny");
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