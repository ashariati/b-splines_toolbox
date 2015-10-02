
% housekeeping
disp('Press any key to exit');
figure;
xlim([0 1])
ylim([0 1])
hold on;

% de boor control points
d = [];

while 1
    [x, y, keydown] = ginput(1);
    d = [d; x, y];

    cla;
    plot(d(:, 1), d(:, 2));

    p = b_spline(d);

    if p ~= 0
        plot(p(:, 1), p(:, 2), '*');
    end

    if keydown ~= 1
        break;
    end
        
end

close all;
clear all;
