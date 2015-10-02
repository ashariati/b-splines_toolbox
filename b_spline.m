%===============================================================
% function p = b_spline(d)
% - input: set of de boor control points
% - output: set of points along trajectory
%===============================================================

function p = b_spline(d)

N = size(d, 1) - 1;

B = deBoor_to_bezier(d);
p = B;

return;
