tf = 20; 
Ninf = 10000; 
N0 = 100; 
r = 0.7;
k = 100;
hbar = 0.01;
tbar = 0.5*tf;

% multiple time steps
n = [10];
tN = 4;
for i=1:tN
    n(i) = n(1) * 2^i;
end

figure('DefaultAxesFontSize',20)
lw = 2;
t = 0:tf/n(1):tf;
Ncells = tumor_growth(t, N0, Ninf, hbar, tbar, r, k);
disp(Ncells(length(Ncells)))

plot(t, Ncells, 'DisplayName', sprintf('N = %d', n(1)), 'LineWidth',lw)
for i=2:tN
    t = 0:tf/n(i):tf; 
    Ncells = tumor_growth(t, N0, Ninf, hbar, tbar, r, k);
    
    hold on
    plot(t, Ncells, 'DisplayName', sprintf('N = %d', n(i)), 'LineWidth',lw)
end 
title('cancer cells')
legend()