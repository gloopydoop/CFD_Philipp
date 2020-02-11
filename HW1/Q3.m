clear all
clc
close all
%% Task 2
numprec=single(1.0); % Define 1.0 with double precision
while(1 < 1 + numprec)
numprec=numprec*0.5;
end
machine_single=numprec*2;

numprec=double(1.0); % Define 1.0 with single precision
while(1 < 1 + numprec)
numprec=numprec*0.5;
end
machine_double=numprec*2;


%% Task 3, pt 1)
f = @(x)(1./(x+2) + x.^2);
dnf = @(x,dx)((f(x + dx) - f(x - dx))./(2*dx));
df = @(x)(-1./(x+2).^2 + 2.*x);
x = 2;

dx_single = single(logspace(-20,0));
eps_single = abs((df(x) - dnf(x,dx_single))./df(x));

dx_double = double(logspace(-20,0));
eps_double = abs((df(x) - dnf(x,dx_double))./df(x));

figure(1)
loglog(dx_single,eps_single,'--b',dx_double,eps_double,'--r')
grid on
xlim([10e-20,1])
ylim([10e-16,1e5])
legend('Single','Double','interpreter','latex')
xlabel('$\Delta x$','interpreter','latex')
ylabel('$\epsilon_d$','interpreter','latex')
%% Task 3, pt 2)

d2f = @(x)(2./(x+2).^3 + 2);
d3f = @(x)(-6./(x+2).^4);

xi_d = @(x,dx)(dx.^2.*abs(d3f(x))./(6*abs(df(x))));
xi_p = @(x,dx,machine)(abs(f(x)).*machine./(abs(df(x)).*dx));

min_val = @(x,machine)((3*abs(f(x)).*machine./abs(d3f(x))).^(1/3));

figure(2)
loglog(dx_single,eps_single,'--r')
hold on
loglog(dx_double,eps_double,'--b')



loglog(dx_double,xi_d(x,dx_double),'-k')
loglog(dx_single,xi_p(x,dx_single,machine_single),'-r')
loglog(dx_double,xi_p(x,dx_double,machine_double),'-b')
loglog(dx_single,xi_d(x,dx_single) + xi_p(x,dx_single,machine_single),':r')
loglog(dx_double,xi_d(x,dx_double) + xi_p(x,dx_double,machine_double),':b')
legend({'$\epsilon_d$ Single','$\epsilon_d$ Double','$\xi_d$','$\xi_p$ Single','$\xi_p$ Double','$\xi_p + \xi_p$ Single','$\xi_p + \xi_p$ Double'},'interpreter','latex')
loglog([min_val(2,machine_single),min_val(2,machine_single)],[1e-16, 1e5],'-r','linewidth',1.5)
loglog([min_val(2,machine_double),min_val(2,machine_double)],[1e-16, 1e5],'-b','linewidth',1.5)
grid on
xlim([10e-20,1])
ylim([10e-16,1e5])
xlabel('$\Delta x$','interpreter','latex')
ylabel('$\epsilon_d$','interpreter','latex')










