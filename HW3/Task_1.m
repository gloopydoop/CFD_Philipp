clear all
clc
close all

N = 20;
p = 2*pi();
dx = p/N;

D = -1*eye(N) + diag(ones(N-1,1),1);
D(N,1) = 1;
D = 1/dx*D;

x = 0:dx:2*pi()-dx;
x = x';
k = 3;

f = exp(i*k*x)
df_analytic = i*k*exp(i*k*x)
df_num = D*f

plot(x,real(df_analytic),x,real(df_num))
xlabel('x')
ylabel('f''(x) ')
legend('Analytic','numerical')

mu = df_num./f
k_mod = (exp(i*k*dx) -1)/dx