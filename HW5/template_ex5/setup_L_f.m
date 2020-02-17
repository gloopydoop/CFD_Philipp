function [L,f,hx,hy,X,Y] = setup_L_f(Nx,Ny)

Lx = 1;  Ly = 1;                         % Size of the domain  
hx = Lx/Nx; hy = Ly/Ny;                  % Grid spacing
x = linspace(0,Lx,Nx+1);                 % x-coordinates length N+1 at grid nodes
y = linspace(0,Ly,Ny+1);                 % y-coordinates length N+1 at grid nodes

% Assemble x and y - coordinate at cell centers into 1-D vector length N*N
X = (x(1:end-1) + x(2:end))/2;
Y = (y(1:end-1) + y(2:end))/2;

% Define the forcing function (NOTE: correct ordering!)
[x_mg, y_mg] = meshgrid(X,Y);
f = cos(3*pi*x_mg).*(exp(y_mg.^2) + 2.*y_mg.^2.*exp(y_mg.^2)-exp(1));
f=reshape(f',Nx*Ny,1); % could be wrong!!!

%-----------------------------------------
% Assemble laplacian matrix
L = Lapl(Nx, Ny, hx, hy);

% % Set one Dirichlet value to fix pressure in one point
L(1,:) = zeros(size(f)); L(1,1) = 1; f(1)=0;
