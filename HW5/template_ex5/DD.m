function A = DD(n,h)
% DD(n,h)
%
% One-dimensional finite-difference derivative matrix 
% of size n times n for second derivative:
%
% This function belongs to SG2212.m

A = diag([ones(n-1,1)],-1) + ...
    diag([-2*ones(n,1)],0) + ...
    diag([ones(n-1,1)],1);
% boundary conditions aswell!
A(1,1) = -1;
A(n,n) = -1;

A = 1/h^2*A;