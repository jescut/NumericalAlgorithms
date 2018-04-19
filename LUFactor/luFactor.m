function [L,U,P] = luFactor(A)
% % %luFactor gives the L U and P of a given matrix 
%   Inputs: A - coefficent matrix   
%   Outputs: L- Lower triangular matrix
%            U- Upper trianguar matrix
%            P- Pivot matrix
% Check if a matirx and nothing else was inputed
if nargin > 1
    error(' Too many imputs, function only needs one square matrix')
end 
% Check if A is square matrix
sz = size(A);
% sz(1)= rows sz(2)= columns
if sz(1)~=sz(2)
    error('A is not a square matix')
end

% Ceating starting matricies
% Eye funtion creates an identity matrix of ones in the diagonal
  L= eye(sz);
  U= zeros(sz); % empty 0 matrix to fill
  P= eye(sz);
   %check every row for pivot 
    for i=1:sz
        %Finding the row max value in the 1st column(moves along column
        %with loop)
        [mar, mar]= max(abs(A(i:sz,i))); 
        
        % assigning variable to that row 
        row= sz-(sz-i+1)+mar;
        
      % switching rows with max value to top in the A L and P matricies
        
        A([i row],:)= A([row i],:);
        
         % moves the 1's where thr rows moved to in P
        P([i row],:)= P([row i],:); 
        
         % spot corrisponding to where the elimination will happen 
        L([i row],:)= L([row i],:);
               
      % creates the factor you multiply by and puts it in L matrix
            l= A(i:sz,i) / A(i,i); 
            L(i:sz,i)= l;
        
      % Preform Guass elimination and replace it in the matrix
            a= A(i+1:sz,1:sz) - L(i+1:sz,i)*A(i,1:sz); 
            A(i+1:sz,1:sz)= a;
        
        % Replaces the new line after multiplication and elimination in U
        % matrix
            U(i,1:sz)= A(i,1:sz);
    end
    L
    U
    P