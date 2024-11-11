% Parameters
t0 = 0;           % Initial time
y0 = 1;           % Initial condition
t_final = 5;      % Final time
h = 0.1;          % Step size for Euler method

% Define the differential equation as a function handle
f = @(t, y) -2 * y;

% Time vector for Euler method
t_euler = t0:h:t_final;
N = length(t_euler);

% Initialize the solution vector for Euler method
y_euler = zeros(1, N);
y_euler(1) = y0;

% Euler method
for i = 1:N-1
    y_euler(i+1) = y_euler(i) + h * f(t_euler(i), y_euler(i));
end

% Solve the same problem with ode45 for comparison
[t_ode45, y_ode45] = ode45(f, [t0 t_final], y0);

% Exact solution for comparison
y_exact = exp(-2 * t_euler);

% Plot the results
figure;
plot(t_euler, y_euler, 'b-o', 'DisplayName', 'Euler Method');
hold on;
plot(t_ode45, y_ode45, 'r-', 'DisplayName', 'ode45');
plot(t_euler, y_exact, 'k--', 'DisplayName', 'Exact Solution');
xlabel('Time t');
ylabel('y(t)');
title('Comparison of Euler Method and ode45');
legend show;
grid on;
