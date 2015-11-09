function [L, U] = lutri(A)

% size
n = size(A, 1);

% extract diagonal, subdiagonal and superdiagonal
a = diag(A, -1);
b = diag(A);
c = diag(A, 1);

% vectorize process
off = 1;
delta = zeros(n+1, 1);
delta(0 + off) = 1;
delta(1 + off) = b(1);
M = [b(2:end), - a .* c];

% loop
for k=2:n
    delta(k  + off) = M(k-1, 1:end) * delta([(k - 1) + off, (k - 2) + off]);
end

% diagonal big delta matrix
Delta  = delta(1 + off:end)   ./ delta(0 + off:end-1);
Delta_ = delta(0 + off:end-2) ./ delta(1 + off:end-1); 

% build L and U
L = full(gallery('tridiag', (a .* Delta_), ones(n, 1), zeros(n-1, 1)));
U = full(gallery('tridiag', zeros(n-1, 1), Delta, c));

return;
