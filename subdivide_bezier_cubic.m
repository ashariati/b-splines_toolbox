%===============================================================
% function b = subdivide_bezier_cubic(b)
% - input: bezier control points
% - output: subdivided curve
%===============================================================
function b = subdivide_bezier_cubic(b)

if size(b, 1) < 4
    return;
end

b_0 = b;
b_1 = (1/2) * b_0(1:end-1, :) + (1/2) * b_0(2:end, :);
b_2 = (1/2) * b_1(1:end-1, :) + (1/2) * b_1(2:end, :);
b_3 = (1/2) * b_2(1:end-1, :) + (1/2) * b_2(2:end, :);

b= [b_0(1, :);
    b_1(1, :);
    b_2(1, :);
    b_3(1, :);
    b_3(end, :);
    b_2(end, :);
    b_1(end, :);
    b_0(end, :)];

return;
