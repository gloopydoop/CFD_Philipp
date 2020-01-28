clear all
clc
close all

N = [20,100,500];
T = 10;
dt = T./N;
lam = -3/4 + i*pi();


Euler_E = @(u_n,lam,dt)(u_n*(1+lam*dt));
Euler_I = @(u_n,lam,dt)(u_n/(1-lam*dt));
Crank_Nico = @(u_n,lam,dt)((2 + lam*dt)/(2-lam*dt)*u_n);
Analytic = @(t,lam)(exp(lam.*t));

U_0 = 1;

t = cell(size(N));
U_Euler_E = cell(size(N));
U_Euler_I = cell(size(N));
U_Crank_Nico = cell(size(N));

for n = 1:size(N,2)
    dt = T/N(n);
    t{n} = linspace(0,T,N(n)+1);
    
    U_Euler_E{n} = zeros(1,N(n)+1);
    U_Euler_I{n} = zeros(1,N(n)+1);
    U_Crank_Nico{n} = zeros(1,N(n)+1);
    
    U_Euler_E{n}(1) = U_0;
    U_Euler_I{n}(1) = U_0;
    U_Crank_Nico{n}(1) = U_0;
    for i = 2:N(n)+1
        U_Euler_E{n}(i) = Euler_E(U_Euler_E{n}(i-1),lam,dt);
        U_Euler_I{n}(i) = Euler_I(U_Euler_I{n}(i-1),lam,dt);
        U_Crank_Nico{n}(i) = Crank_Nico(U_Crank_Nico{n}(i-1),lam,dt);
    end
end

% Plotting
figure(1)
for n = 1:size(N,2)
    subplot(1,3,n)
    plot(t{n}, real(Analytic(t{n},lam)),'k')
    hold on
    plot(t{n}, real(U_Euler_E{n}))
    plot(t{n}, real(U_Euler_I{n}))
    plot(t{n}, real(U_Crank_Nico{n}))
    axis([0, T, -1, 1])
end

%% part 3
z = linspace(-10,0.05);
G_Euler_E = @(z)(1 + z);
G_Euler_I = @(z)(1./(1-z));
G_Crank_Nico = @(z)((2 + z)./(2 - z));
figure(2)
plot(z,G_Euler_E(z),z,G_Euler_I(z),z,G_Crank_Nico(z))




