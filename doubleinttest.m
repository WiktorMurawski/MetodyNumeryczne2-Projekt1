% Define the function to integrate
f = @(x, y) x + 5 + y; % Example: f = @(x, y) x + y;

% Define the vertices of the triangle
x1 = 1; y1 = 1;
x2 = 2; y2 = 3;
x3 = 3; y3 = 2;

% Gauss point and weight for degree < 2 (single point at centroid of reference triangle)
xi = 1/3; eta = 1/3;
w = 1/2;

% Map the Gauss point to the actual triangle
x_G = x1 + (x2 - x1) * xi + (x3 - x1) * eta;
y_G = y1 + (y2 - y1) * xi + (y3 - y1) * eta;

% Evaluate the function at the mapped Gauss point
f_val = f(x_G, y_G)

% Compute the Jacobian determinant |J|
J = abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));

% Compute the integral approximation
integral_approx = J * w * f_val;

% Display the result
disp(['Approximate integral value: ', num2str(integral_approx)]);