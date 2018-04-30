function [t, y] = Heun(dydt, tspan, y0, h, es, maxit)
%Heun function solves for the numerical solution to a differential equation
%over the span tspan
% Inputs:
%   dydt - differential equation
%   tspan - span on t
%   y0 - initial condition
%   h - step size
% *optional
%   es - stopping criterion percent
%   maxit - maximum number of iterations
% Outputs:
%   plot of t and y
if nargin < 3 || nargin > 6
    error('Function requires at least 3 inputs but less-than or equal to 6')
end
% setting defaults for es and maxit
if nargin < = 5
    maxit = 50
    warning(' maxit set to 50 as default')
end
if nargin < 4
    maxit = 50
    es = 0.001
    warning('maxit set to 50 and es set to 0.001 as default')
end

% empty t and y table
y = zeros(1, maxit+1);
t = zeros(1, maxit+1);
es = zeros(1, maxit+1);


% initial conditions (1st row)
y(1) = y0

for i = 1:maxit
 % slope left
 sl = dydt(y(i), t(i));
 % predictor
 t(i+1) = t(i) + h;
 y(i+1) = y(i) + h + dydt(y(i),t(i));
 % slope right
 sr = .5*(sl + y(i+1));
 % corrector
 y(i+1) = y(i) + .5 *h* (sl + sr);
 % error
 es(i+1) = abs((y(i+1)-y(i))/y(i+1)) *100;
end
plot(t,y)
title('Euler Method with Interation')
xlabel('t')
ylabel('y')
end

