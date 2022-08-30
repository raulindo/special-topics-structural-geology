% Calcula a variação em profundidade do esforco litostático na crosta

prof = linspace(0,30000); % metros
rho_gran = 2700; % kg/m3
rho_agua = 1000; % kg/m3
gravity = 10; % m/s2

stress = rho_gran*prof*gravity*10^-6;
stress_agua = rho_agua*prof*gravity*10^-6;

plot(stress_agua, prof/1000, 'linewidth', 1, 'color','b')
hold on

plot(stress, prof/1000, 'linewidth', 1, 'color','r')


set(gca, 'XAxisLocation','top', 'YDir','reverse') % invert y axis
xlabel('tensão vertical (MPa)')
ylabel('profundidade (km)')