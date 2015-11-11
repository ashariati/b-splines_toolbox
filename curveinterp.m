function d = curveinterp(x, cond)

% argument check
if (nargin < 2)
    cond = 'natural';
end

% compute length
N = length(x);

% continue until system large enough
if (N < 4)
    d = 0;
    return;
end

if strcmp(cond, 'natural')
    % using natural end conditions
    A = full(gallery('tridiag', ones(N-3, 1), 4 * ones(N-2, 1), ones(N-3, 1)));
    y = [6 * x(2, :) - x(1, :); 6 * x(3:end-2, :); 6 * x(end-1, :) - x(end, :)];

    % solve
    d = solvetri(A, y);

elseif strcmp(cond, 'quadratic')
    % using quadratic end conditions
    A = full(gallery('tridiag', ones(N-3, 1), 4 * ones(N-2, 1), ones(N-3, 1)));
    A(1, 1)     = 5;
    A(end, end) = 5;

    y = [7 * x(2, :) - x(1, :); ...
         6 * x(3:end-2, :); ...
         7 * x(end-1, :) - x(end, :)];

    % solve
    d = inv(A) * y;

elseif strcmp(cond, 'bessel')
    % using bessel end conditions
    A = full(gallery('tridiag', ones(N-3, 1), 4 * ones(N-2, 1), ones(N-3, 1)));
    A(1, 1)     = 7/2;
    A(end, end) = 7/2;

    d_0 = (1/2) * x(1, :) + (2/3) * x(2, :) - (1/6) * x(3, :);
    d_N = -(1/6) * x(end-2, :) + (2/3) * x(end-1, :) + (1/2) * x(end, :);
    y = [6 * x(2, :) - (3/2) * d_0; ...
         6 * x(3:end-2, :);  ...
         6 * x(end-1, :) - (3/2) * d_N];

    % solve
    d = inv(A) * y;
    d = [d_0; d; d_N];

elseif strcmp(cond, 'knot')
    % using not a knot end conditions

    if (N == 4)
        d_1 = -(1/6) * x(1, :) + (4/3) * x(2, :) - (1/6) * x(3, :);
        d_3 = (7/18) * x(2, :) + (8/9) * x(3, :) + (7/18) * x(4, :) - (2/3) * d_1;
        d_2 = -(1/6) * x(2, :) + (4/3) * x(3, :) - (1/6) * x(4, :);
        d_0 = (7/18) * x(1, :) + (8/9) * x(2, :) + (7/18) * x(3, :) - (2/3) * d_2;
        d = [d_0; d_1; d_2; d_3];
    elseif (N == 5)
        d_1 = -(1/6) * x(1, :) + (4/3) * x(2, :) - (1/6) * x(3, :);
        d_3 = -(1/6) * x(3, :) + (4/3) * x(4, :) - (1/6) * x(5, :);
        d_2 =  (3/2) * x(3, :) - (1/4) * d_1  - (1/4) * d_3;
        d_0 = (7/18) * x(1, :) + (8/9) * x(2, :) + (7/18) * x(3, :) - (2/3) * d_2;
        d_4 = (7/18) * x(3, :) + (8/9) * x(4, :) + (7/18) * x(5, :) - (2/3) * d_2;
        d = [d_0; d_1; d_2; d_3; d_4];
    else
        A = full(gallery('tridiag', ones(N-5, 1), 4 * ones(N-4, 1), ones(N-5, 1)));
        y = [6 * x(3, :) + (1/6) * x(1, :) - (4/3) * x(2, :) + (1/6) * x(3, :); ... 
             6 * x(4:end-3, :); ... 
             6 * x(end-2, :) + (1/6) * x(end-2, :) - (4/3) * x(end-1, :) + (1/6) * x(end, :)];

        % solve
        d_1  = -(1/6) * x(1, :) + (4/3) * x(2, :) - (1/6) * x(3, :);
        d_N1 = -(1/6) * x(end-2, :) + (4/3) * x(end-1, :) - (1/6) * x(end, :);
        d = inv(A) * y;
        d_0 = (7/18) * x(1, :) + (8/9) * x(2, :) + (7/18) * x(3, :) - (2/3) * d(1);
        d_N = (7/18) * x(end-2, :) + (8/9) * x(end-1, :) + (7/18) * x(end, :) - (2/3) * d(end);
        d = [d_0; d_1; d; d_N1; d_N];
    end

else
    error('Invalid end condtion');
    return;
end

return;
