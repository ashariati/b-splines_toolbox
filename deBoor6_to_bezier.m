%===============================================================
% function B = deBoor6_to_bezier(d)
% - input: set of 6 de Boor control points
% - output: set of bezier control points
%===============================================================
function B = deBoor6_to_bezier(d)

off = 1;

% Group 1 independent
b_01 = d(0 + off, :);
b_11 = d(1 + off, :);
b_21 = (1/2) * d(1 + off, :) + (1/2) * d(2 + off, :);

% Group 2 independent
b_12 = (2/3) * d(2 + off, :) + (1/3) * d(3 + off, :);
b_22 = (1/3) * d(2 + off, :) + (2/3) * d(3 + off, :);

% Group 3 independent
b_13 = (1/2) * d(3 + off, :) + (1/2) * d(4 + off, :);
b_23 = d(4 + off, :);
b_33 = d(5 + off, :);

% Joint 1
b_31 = (1/2) * b_21 + (1/2) * b_12;
b_02 = b_31;

% Joint 2
b_32 = (1/2) * b_22 + (1/2) * b_13;
b_03 = b_32;

B_1 = [b_01; b_11; b_21; b_31];
B_2 = [b_02; b_12; b_22; b_32];
B_3 = [b_03; b_13; b_23; b_33];

B = [B_1; B_2; B_3];

return;
