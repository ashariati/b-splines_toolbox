%===============================================================
% function B = deBoor_to_bezier(d)
% - input: set of de boor control points
% - output: set of bezier control points
%===============================================================
function B = deBoor_to_bezier(d)

off = 1;

N = size(d, 1) - 1;

if N < 4
    B = 0;
    return;
end

if N < 5
    B = deBoor5_to_bezier(d);
    return;
end

if N < 6
    B = deBoor6_to_bezier(d);
    return;
end

B_1 = [d(0 + off, :); 
    d(1 + off, :); 
    (1/2) * d(1 + off, :) + (1/2) * d(2 + off, :); 
    (1/4) * d(1 + off, :) + (7/12) * d(2 + off, :) + (1/6) * d(3 + off, :)];

B_2 = [(1/4) * d(1 + off, :) + (7/12) * d(2 + off, :) + (1/6) * d(3 + off, :);
    (2/3) * d(2 + off, :) + (1/3) * d(3 + off, :);
    (1/3) * d(2 + off, :) + (2/3) * d(3 + off, :);
    (1/6) * d(2 + off, :) + (4/6) * d(3 + off, :) + (1/6) * d(4 + off, :)];

B = [B_1; B_2];

for i=3:(N-4)
    B_i = [(1/6) * d(i-1 + off, :) + (4/6) * d(i + off, : ) + (1/6) * d(i+1 + off, :);
        (2/3) * d(i + off, :) + (1/3) * d(i+1 + off, :);
        (1/3) * d(i + off, :) + (2/3) * d(i+1 + off, :);
        (1/6) * d(i + off, :) + (4/6) * d(i+1 + off, :) + (1/6) * d(i+2 + off, :)];
    B = [B; B_i];
end

B_N3 = [(1/6) * d(N-4 + off, :) + (4/6) * d(N-3 + off, :) + (1/6) * d(N-2 + off, :);
    (2/3) * d(N-3 + off, :) + (1/3) * d(N-2 + off, :);
    (1/3) * d(N-3 + off, :) + (2/3) * d(N-2 + off, :);
    (1/6) * d(N-3 + off, :) + (7/12) * d(N-2 + off, :) + (1/4) * d(N-1 + off, :)];

B_N2 = [(1/6) * d(N-3 + off, :) + (7/12) * d(N-2 + off, :) + (1/4) * d(N-1 + off, :);
    (1/2) * d(N-2 + off, :) + (1/2) * d(N-1 + off, :);
    d(N-1 + off, :);
    d(N + off, :)];

B = [B; B_N3; B_N2];

return;
