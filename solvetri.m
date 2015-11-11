function x = solvetri(A, d, method)

if (nargin < 3)
    method = 'lub';
end

% solve with gaussian elimination
tic;
[B, w] = gausel(A, d);
gx = backsub(B, w);
time = toc;
fprintf('Gaussian elimination requires: %f seconds\n', time);

% solve with LU factorization
tic;
[L, U, Delta] = lutri(A);
w = forwardsub(L * Delta, d);
lux = backsub(inv(Delta) * U, w);
time = toc;
fprintf('LU factorization requires: %f seconds\n\n', time);

% return desired
if (strcmp(method, 'gausel'))
    x = gx;
elseif (strcmp(method, 'lub'))
    x = lux;
else
    x = -1;
    error('Invalid method');
    return;
end
