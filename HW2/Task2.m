%% Task 2
clear all
clc
close all

syms dx

A = sym([1,1,1,1; 0, dx, -dx, 2*dx; 0, 1/2*dx^2, 1/2*dx^2, 2*dx^2; 0, 1/6*dx^3, -1/6*dx^3, 4/3*dx^3]);
inv(A)*[0;1;0;0]