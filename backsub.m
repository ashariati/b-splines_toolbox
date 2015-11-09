function x = backsub(A, b)

n = size(A, 2);

% initialize
x = zeros(n, 1);

% solve
for i=n:-1:1
    x(i) = (b(i) - dot(x(i+1:end)', A(i, i+1:end))) / A(i, i);
end

return;
