function [] = test1()

a = 123;
b = 2137;
c = 3;
f = @(x,y) a*x+b*y+c;
%f = @(x,y) x^2+y^2;

n = 20;
q = P1Z23_WMU_DoubleIntegralOnSquare(f,n);
exact = ExactIntegralValue(f);

fprintf("Funkcja: %s\n",func2str(f))
fprintf("Wartość oczekiwana: %h\n",exact)
fprintf("Wartość obliczona: %h\n",q)
fprintf("Błąd: %h" + ...
  "\n",q-2*c);

end