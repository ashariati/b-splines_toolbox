%===============================================================
% function B = deBoor5_to_bezier(d)
% - input: set of 5 de boor control points
% - output: set of bezier control points
%===============================================================
function B = deBoor5_to_bezier(d)

off = 1;

% Group 1
b_01 = d(0 + off, :);
b_11 = d(1 + off, :);
b_21 = (1/2) * d(1 + off, :) + (1/2) * d(2 + off, :);
b_31 = (1/4) * d(1 + off, :) + (1/2) * d(2 + off, :) + (1/4) * d(3 + off, :);

% Group 2
b_02 = b_31;
b_12 = (1/2) * d(2 + off, :) + (1/2) * d(3 + off, :);
b_22 = d(3 + off, :);
b_32 = d(4 + off, :);

B_1 = [b_01; b_11; b_21; b_31];
B_2 = [b_02; b_12; b_22; b_32];

B = [B_1; B_2];

return;
