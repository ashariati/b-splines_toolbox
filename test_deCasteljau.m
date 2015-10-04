
close all;
clear all;

% housekeeping
figure;
xlim([0 1])
ylim([0 1])
hold on;

% Number of subdivisions
n = 6;

% Number of control points
N = 5;
fprintf('Click %d points to draw Bezier curve of degree %d\n', N, N-1);

[x, y] = ginput(N);

% Bezier control points
B = [x, y];

% reset figure and plot de Boor points
cla; 
plot(B(:, 1), B(:, 2));

p = deCasteljau(B, n, N-1);

% plot approximated spline curve
plot(p(:, 1), p(:, 2));

