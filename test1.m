function [] = test1()
%szerokość 75
%wysokość 21

% for i = 1:21
%   for j = 1:75
%     fprintf("#");
%   end
%   fprintf("\n");
% end

% Create a table with function name, exact value, and approximations
function_names = {'f(x) = x^2', 'f(x) = sin(x)'};
exact_values = [10.5, 5];
approximations = [13,13 14;14, 15,15];

% Format the table in MATLAB
t = table(function_names', exact_values', approximations(:,1), approximations(:,2), approximations(:,3), ...
    'VariableNames', {'Function', 'ExactValue', 'Approx_n5', 'Approx_n10', 'Approx_n20'});

% Display the table
disp(t);

% % Display the table in a custom format
% fprintf('%-20s %-10s %-10s %-10s %-10s\n', 'Function', 'Exact Value', 'Approx_n5', 'Approx_n10', 'Approx_n20');
% for i = 1:length(function_names)
%     fprintf('%-30s %-20.10f %-10.5f %-10.5f %-10.5f\n', function_names{i}, exact_values(i), approximations(i,:));
% end



% a = 123;
% b = 2137;
% c = 3;
% f = @(x,y) a*x+b*y+c;
% f = @(x,y) x^2+y^2;

% n = 100;
% q = P1Z23_WMU_DoubleIntegralOnSquare(f,n);
% exact = ExactIntegralValue(f);
% 
% fprintf("Funkcja: %s\n",func2str(f))
% fprintf("Wartość oczekiwana: %f\n",exact)
% fprintf("Wartość obliczona: %f\n",q)
% fprintf("Błąd: %f\n",q-exact);

end