%===============================================================
% function p = b_spline(d, n)
% - input: d, n
%       d: deBoor control points
%       n: number of subdivisions desired
% - output: set of points along trajectory
%===============================================================
function [p, B] = b_spline(d, n)

% compute bezier control points
B = deBoor_to_bezier(d);
if B == 0
    p = 0;
    return;
end

p = [];

% subdivide Curve segments
for i=1:4:size(B, 1)
    p = [p; deCasteljau(B(i:i+3, :), n, 3)];
end

return;
