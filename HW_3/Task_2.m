clear all
clc
close all

eps_A_FO = @(sig,phi)(1-2.*sig.*(1-sig).*(1-cos(phi)));
eps_P_FO = @(sig,phi)(atan((sig.*sin(phi))./(1-sig+sig.*cos(phi)))./(sig.*phi));

eps_A_LF = @(sig,phi)(1);
eps_P_LF = @(sig,phi)(atan((sig.*sin(phi)./sqrt(1-sig.^2.*(sin(phi).^2))))./(sig.*phi));

sig = [0.1,0.25,0.5];
phi = linspace(0,pi);

figure(1)
for i = 1:3
    subplot(1,3,1)
    plot(phi,eps_A_FO(sig(i),phi))
    hold on
    grid on
    axis([0 pi 0 1])
    
    subplot(1,3,2)
    plot(phi,eps_P_FO(sig(i),phi))
    hold on
    grid on
    axis([0 pi 0 1]) 
    
    subplot(1,3,3)
    plot(phi,eps_P_LF(sig(i),phi))
    hold on
    grid on
    axis([0 pi 0 1])
end

legend('0.1','0.25','0.5')