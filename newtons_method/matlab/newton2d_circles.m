%% 
% newton_circles.m
%
% Josh Kaplan
%
% Newton's Method to solve for the intersection of two circles.
% This script should work with either MATLAB and Octave.
%
close all; clear all; clc;

% Circle 1
r1 = 200;
x1 = 0;
y1 = 0;

% Circle 2
r2 = 100;
x2 = 200;
y2 = 200;

%% Newton's Method
% F1(x, y) = (x - x1)^2 + (y - y1)^2 - 200^2 = 0
% F2(x, y) = (x - x2)^2 + (y - y2)^2 - 100^2 = 0 

% Memory Allocation
F = zeros(2);
J = zeros(2, 2);
X = zeros(2);

% Initial Guess
X(1) = sqrt(200);
X(2) = 0;

% Newton's Method
MaxIters = 8; 
Tol = 1e-3;
for i = 1:MaxIters
    x = X(1);
    y = X(2);
    
    % Functions
    F(1) = ;
    F(2) = (x - x2).^2 + (y - y2).^2 - r2^2;
    
    % Jacobian
    J(1,1) = (2*x - 2*x1); % dF1/dx 
    J(1,2) = (2*y - 2*y1); % dF1/dy 
    J(2,1) = (2*x - 2*x2); % dF2/dx
    J(2,2) = (2*y - 2*y2); % dF2/dy
    X = X - J\F; 
end

fprintf('Converged to (%.2f %.2f) in %d iterations.\n', X(1), X(2), i)

%% Plot
theta = 0:pi/1000:2*pi; 

% Plot circle 1 and hold 
figure;
hold on;
grid on;
plot(x1 + r1*cos(theta), y1 + r1*sin(theta), '');
plot(x1, y1, 'b.')

% Plot circle 2 and hold 
plot(x2 + r2*cos(theta), y2 + r2*sin(theta), '');
plot(x2, y2, 'r.')

% Plot the point
plot(X(1), X(2), 'co')
