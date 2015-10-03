
close all;
clear all;

% housekeeping
figure;
xlim([0 1])
ylim([0 1])
hold on;

% Number of control points
N = 8;

[x, y] = ginput(N);

% Bezier control points
B = [x, y];

% reset figure and plot de Boor points
cla; 
plot(B(:, 1), B(:, 2));

p = deCasteljau(B, 6, N-1);

% plot approximated spline curve
plot(p(:, 1), p(:, 2));

