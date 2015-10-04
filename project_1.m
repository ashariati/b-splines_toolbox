
% housekeeping
disp('Press any key to exit');
figure;
xlim([0 1])
ylim([0 1])
hold on;

% de boor control points
d = [];

% number of subdivisions desired
n = 6;

while 1

    % get input
    [x, y, keydown] = ginput(1);
    d = [d; x, y];

    % reset figure and plot de Boor points
    cla; 
    plot(d(:, 1), d(:, 2));

    % compute points on spline and Bezier control points
    [p, B] = b_spline(d, n);

    if p == 0
        continue;
    end

    % plot approximated spline curve
    plot(p(:, 1), p(:, 2));

    % plot Bezier control points
    plot(B(:, 1), B(:, 2), '*');

    if keydown ~= 1
        break;
    end
        
end

close all;
clear all;
