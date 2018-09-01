%% 1D Newton's Method
%--------------------------------------------------------------------------
% newton1d_generic.m
% 
% Josh Kaplan
% jk@ucf.edu
%
% An example of using Newton's Method to solve for a particular value
% of a function, rather than it's root.
%--------------------------------------------------------------------------
close all; clear all; clc;

%% Configuration
% Display plot
display = 1;                      % 1=yes, 0=no          <= EDIT THIS LINE

% Function
f = @(x) 2*x.^3 - x.^2 + 4*x - 8; % Function f(x)        <= EDIT THIS LINE
df = @(x) 6*x^2 -2*x + 4;         % Derivative f'(x)     <= EDIT THIS LINE

% Parameters
Y = 4;                            % The Y value to solve <= EDIT THIS LINE
X = 6;                            % Initial guess        <= EDIT THIS LINE
N = 1000;                         % Maximum iterations   <= EDIT THIS LINE
TOL = 1e-3;                       % Tolerance            <= EDIT THIS LINE

%% Newton's Method
for i = 1:N
    func  = f(X);                       % Function f(x)  
    dfunc = df(X);                      % Derivative f'(x)
    X  = X + Y/dfunc - func/dfunc;      % New guess
    if abs(func) < TOL                     % If our delta is close enough
        break                           % exit the loop
    end
end

% Print results
fprintf('Converged to %6.4f in %d iterations\n', X, i)

%% Plot the results

if display
    % Compute the function
    x = -10:.01:10; 
    y = f(x);

    % Initialize the figure
    figure;
    hold on;
    grid on;
    
    % Plot the function
    plot(x, y, 'b', 'Linewidth', 2);
    
    % Plot the solution
    plot(X, func, 'ro')   
    hold off
end

  



