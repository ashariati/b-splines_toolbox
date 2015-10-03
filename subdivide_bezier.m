%===============================================================
% function b = subdivide_bezier(b, m)
% - input: b, m
%       b: bezier control points
%       m: degree of curve
% - output: subdivided curve
%===============================================================
function b = subdivide_bezier(b, m)

if size(b, 1) == 1
    b = [b; b];
    return;
else
    b_last = b;
    b_next = (1/2) * b_last(1:end-1, :) + (1/2) * b_last(2:end, :);
    b = [b_last(1, :);
        subdivide_bezier(b_next, m);
        b_last(end, :)];
end

return;
