function [A, b] = gausel(A, b)

[n, m] = size(A);

for j=1:m-1

    % pick the pivot
    [pi, i] = max(A(:, j));

    % permute
    A([j, i], :) = A([i, j], :);
    b([j, i]) = b([i, j]);
    
    % eliminate
    r = -A(j+1:end, j) / pi;
    A(j+1:end, :) = A(j+1:end, :) + repmat(r, 1, m) .* repmat(A(j, :), n-j, 1);
    b(j+1:end) = b(j+1:end) + r .* repmat(b(j), n-j, 1);

end

return;
