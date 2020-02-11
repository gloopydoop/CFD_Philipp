clear all
clc
close all

global X DX
global GAMMA R P0 RHO0 P1 RHO1 Kentr;
global C2 C0;

C0_in = [0.05,0.05,0.4,0.05];
C2_in = [0.45,0.05,0.05,0.25];
CN = [0.5,0.9];

for j = 1:length(CN)
    for i = 1:length(C0_in)
        shock = shocktube(C0_in(i),C2_in(i),CN(j));
        close all
        plot(shock(:,2),shock(:,1))
        hold on
        c_left = sqrt(RHO0.^(GAMMA-1)*Kentr*GAMMA)
        v_shock = RHO0*c_left/(RHO0 - RHO1);
        plot([0,0.01],[1.5, 1.5 + v_shock*0.01])
        
    end
end