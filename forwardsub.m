%===============================================================
% function x = forwardsub(A, b)
% - input: A, b
%       A: lower triangular matrix
%       b: result of A*x
% - output:
%       x: solution to system
%===============================================================
function x = forwardsub(A, b)

n = size(A, 2);
dim = size(b, 2);

% initialize
x = zeros(n, dim);

% solve
for i=1:n
    x(i, :) = ( b(i, :) - ( x(1:i, :)' * A(i, 1:i)' )' ) / A(i, i);
end

return;
