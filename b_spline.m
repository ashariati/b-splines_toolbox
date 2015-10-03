%===============================================================
% function p = b_spline(d)
% - input: set of de boor control points
% - output: set of points along trajectory
%===============================================================
function [p, B] = b_spline(d)

N = size(d, 1) - 1;

% compute bezier control points
B = deBoor_to_bezier(d);
if B == 0
    p = 0;
    return;
end

p = [];

% subdivide Curve segments
for i=1:4:size(B, 1)
    p = [p; deCasteljau(B(i:i+3, :), 6, 3)];
end

return;
