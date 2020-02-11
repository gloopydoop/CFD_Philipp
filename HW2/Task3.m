clear all
clc
close all
%% Task 3
G_Runge_Kutta = @(z)(1 + z + z.^2/2 + z.^3/6 + z.^4/24)
[X,Y] = meshgrid(-5:0.1:5,-5:0.1:5);
Z = X + Y*sqrt(-1);
figure(3)
contour(X,Y,abs(G_Runge_Kutta(Z)),[1 1])
hold on
grid on
%plot([0,0],[-5,5])