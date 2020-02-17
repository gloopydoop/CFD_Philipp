clear all
clc
close all

Nx = 50;                                 % Number of points in x
Ny = 50;                                 % Number of points in y
% Set up the tolerance and maximum number of iterations
tol   = 10^-6;
maxit = 100;
omega = 1.9;                             % SOR parameter

    



%% First part
% % Solve the problem with a direct method (Matlab's backslash)
% [L,f,hx,hy,X,Y] = setup_L_f(Nx,Ny);
% p_direct = L\f;
% % plot p_direct
% figure(2)
% surf(X, Y, reshape(p_direct, Nx, Ny)')
% zlabel('p_{dir}')
% xlabel('x')
% ylabel('y')
% r = [];

%% Second part
% omega = 1:0.2:2;
% [L,f,hx,hy,X,Y] = setup_L_f(Nx,Ny);
% p0 = zeros(size(f));
% figure()
% for i =1:length(omega)
%      [p, r] = GS_SOR(omega(i), Nx, Ny, hx, hy, L, f, p0, tol, maxit);
%     semilogy(r)
%     leg{i} = ['\omega = ',num2str(omega(i))];
%     hold on
% end
% 
% xlabel('Iteration')
% ylabel('Residual')
% legend(leg)
% grid on

%% Third part
% Nx = 30:10:90; % my laptop ran out of memory at 100...
% Ny = Nx;
% figure()
% for i =1:length(Nx)
%     [L,f,hx,hy,X,Y] = setup_L_f(Nx(i),Ny(i));
%     p0 = zeros(size(f));
%     [p,r] = GS_SOR(1, Nx(i), Ny(i), hx, hy, L, f, p0, tol, maxit);
%     semilogy(r)
%     leg{i} = ['Nx = Ny = ',num2str(Nx(i))];
%     hold on
% end
% 
% xlabel('Iteration')
% ylabel('Residual')
% legend(leg)
% grid on

%% Forth part
tol   = 10^-6;
maxit = 1000;

[L,f,hx,hy,X,Y] = setup_L_f(Nx,Ny);
p0 = zeros(size(f));
[p, flag, endrelres, iter, reshist] = gmres(L, f, [], 10^-6,maxit);
semilogy(reshist/norm(f))
[p,r] = GS_SOR(1, Nx, Ny, hx, hy, L, f, p0, tol, maxit);
hold on
semilogy(r)
[p,r] = GS_SOR(1.9, Nx, Ny, hx, hy, L, f, p0, tol, maxit);
semilogy(r)
xlabel('Iteration')
ylabel('Residual')
grid on
legend('gmres','GS','SOR')
%-----------------------------------------
% plots
