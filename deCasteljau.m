%===============================================================
% function p = deCasteljau(b, n, m)
% - input: b, n
%       b: 4 bezier control points (single curve segment)
%       n: number of subdivisions
%       m: degree of bezier curve
% - output: polygonal line approximating bezier curve
%===============================================================
function p = deCasteljau(b, n, m)

if size(b, 1) < 4
    p = 0;
    return;
end

% levels of subdivision
for i=1:n

    % clear points from last level
    p = [];
    
    % subdivide finer segments
    for j=1:m+1:size(b, 1)

        p = [p; subdivide_bezier(b(j:j+m, :), m)];
        % p = [p; subdivide_bezier_cubic(b(j:j+3, :))];

    end

    % new control points to feed the next level
    b = p;
end

p = b;

return;
