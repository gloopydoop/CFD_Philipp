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
        coefs = polyfit(shock(10:end,2),shock(10:end,1),1); % tendline for shock
        s = mean(shock(10:end,3)); % average of analytic solution
        disp(['CN:',num2str(CN(j)),', C0:',num2str(C0_in(i)),', C2:',num2str(C2_in(i)),...
            '   Measured: ',num2str(coefs(1)),'m/s   Analytic: ',num2str(s),'m/s'])
        
    end
end