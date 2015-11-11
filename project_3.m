
% housekeeping
disp('Press any key to exit');
figure;
xlim([0 1])
ylim([0 1])
hold on;

% tangent points
x = [];

% number of subdivisions desired
n = 6;

while 1

    % get input
    [px, py, keydown] = ginput(1);
    x = [x; px, py];

    % reset figure and plot de Boor points
    cla; 
    plot(x(:, 1), x(:, 2), 'o');

    % solve system
    d = curveinterp(x, 'natural');
    if d == 0
        continue;
    end

    % compute points on spline and Bezier control points
    [p, B] = b_spline(d, n);
    if p == 0
        continue;
    end

    % plot deBoor
    plot(d(:, 1), d(:, 2));

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
