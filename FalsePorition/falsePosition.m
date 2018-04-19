function [root, fx, ea, iter] = falsePosition(func,xl, xu, es, maxiter)
% falsePosition function uses the false position method to estimate the
% root of a a given funtion given a braket interval.
% Inputs
%    func - the function being evaluated
%    xi - the lower guess
%    xu - the uper guess
%    es - the desired relative error ( default 0.0001%)    
%    maxiter - the number of iterations desired ( defailt 200)
% Outputs
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative erroe (%)
%   iter - how many iterations were performed
if nargin < 3
    error('function requires at least 3 inputs')
end
if nargin < 5
    maxiter = 200;
end
if nargin < 4
    es = 0.0001;
end

test = func(xu) *  func(xl);
ea = abs( (xu) - (xl) / (xu) ) * 100;
iter = 0;
while ea>=es && iter<maxiter 
    iter = iter + 1 ;
    test = func(xu) *  func(xl);  
  if test < 0 && ea>=es && iter<maxiter
    root = (xu) - (( (func(xu)) * (xl - xu))/ ((func(xl)) - (func(xu)))); %calcuate root
    root = vpa(root); % my command window displayed fraction so changing it to decimal
    fx = func(root); %evaluating f at the estimated root 
    if fx * func(xl) < 0 && fx ~= 0% testing root for new bound
       xu = root; % root is new upper bound
       ea = abs(xu - xl / xu); 
       test = func(xu) *  func(xl);
    elseif fx * func(xl) > 0 && fx ~= 0% root*f(xl) positive
       xl = root; % root is new lower bound 
       ea = abs(xl - xu / xl) * 100;
       test = func(xu) *  func(xl);
    else % root*f(xl) = 0
        root = vpa(root);
        ea = 0;
    end
  end
end
end
