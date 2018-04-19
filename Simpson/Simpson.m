function I = Simpson(x,y)
%Simpson function calculates the integral of a vetor of funtion values y
%with resopect to x 
%   x = x coordinates of point
%   y = y coordinates of point
%   I = Integral of the vector
% Checking for errors
if nargin < 2
    error('Function requires 2 imputs')
end
if nargin > 2
    error(' Function only requires 2 inputs')
end
if length(x)~=length(y)
    error('x inputs is not equal to y inputs')
end
diffm = diff(x); % creating the matrix of the differences between points
if max(diffm) - min(diffm) ~= 0 
    error('Points are not evenly spaced')
end
% Start working out 
   % smallest value of vector
    a = min(x);
   % largest value of vector
    b = max(x);
   % number of segments
    n = length(x) - 1; 
   % step size
    h = (b-a) ;
    
    i = length(x);
   
% mod takes number of x and divides by two if theres a remainder it is odd
if mod(x,2)==0
    % even segments use 1/3 composite
     it= 1 : i-2
          xo = sum(y(1:2:i));
          xe = sum(y(2:2:i-1));
         I = h * (y(1) + (4.*xo) + ((2.*xe) + y(end))/ (3.*n))
else
    % summing odd placements values
    xo = sum(y(1:2:i-2));
   % summing even placemnets values
    xe = sum(y(2:2:i-1));
  % warns about trap rule
    warning(' The trapezoidal rule must be used on the last interval')
  % odd number of segments use trap rule for last interval
     for it = 1:i 
       % re defining a and b
        at = x(end-1);
       %ignorning the last elemente
        bt = x(end);  
       % last element
        t = x(end);
       % doing 1/3 composite 
        scomp = h * (y(1) + (((4*xo) + (2*xe) + y(end))/ (3*n)));
       % doing trap rule
        fu=y(end);
        fl=y(i-1);
        trapr = (bt-at) * ((fu + fl)/2);
       % summing both rules for I
        I = scomp + trapr;
     end
    
end
 

