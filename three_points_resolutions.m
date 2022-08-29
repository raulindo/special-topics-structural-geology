% This function is numerical solution for the three-point-problem.
% Ponto A | 200 m, 070 | cota 700 m
xa = 200*sind(070); ya = 200*cosd(70); za = 700;
a = [xa ya za];
% Ponto B | 100 m, 330 | cota 900 m
xb = 100*sind(330); yb = 100*cosd(330); zb = 900;
b = [xb yb zb];
% Ponto C | 100 m, 210 | cota 1200 m
xc = 100*sind(210); yc = 100*cosd(210); zc = 1200;
c = [xc yc zc];

% calcula dois vetores diferencas
vec_diff_1 = c - a;
vec_diff_2 = c - b;

% cross product do vetor diff pelo vetor B
% pois o vetor resultante sera perpendicular aos dois vetores que sera o
% polo do plano
% dividimos pela magnitude do vetor para normaliza-lo
poleplane = cross(vec_diff_1, vec_diff_2)/norm(cross(vec_diff_1, vec_diff_2));

% converte para plano
cossdir2plane(poleplane)