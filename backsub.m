%===============================================================
% function x = backsub(A, b)
% - input: A, b
%       A: upper triangular matrix
%       b: result of A*x
% - output:
%       x: solution to system
%===============================================================
function x = backsub(A, b)

n = size(A, 2);
dim = size(b, 2);

% initialize
x = zeros(n, dim);

% solve
for i=n:-1:1
    x(i, :) = ( b(i, :) - ( x(i+1:end, :)' * A(i, i+1:end)' )' ) / A(i, i);
end

return;
