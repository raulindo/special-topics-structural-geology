% This function is numerical solution for the three-point-problem.
% Ponto A | 200 m, 070º | cota 700 m
xa = 200*cosd(070); ya = 200*sind(70); za = 700;
a = [xa ya za];
% Ponto B | 100 m, 330º | cota 900 m
xb = 100*cosd(330); yb = 100*sind(330); zb = 900;
b = [xb yb zb];
% Ponto C | 100 m, 210º | cota 1200 m
xc = 100*cosd(210); yc = sind(210); zc = 1200;
c = [xc yc zc];

% diferença entre o maior e menor cota do vetor
vec_diff = c - a;

% cross product do vetor diff pelo vetor B
% pois o vetor resultante será perpendicular aos dois vetores que será o
% polo do plano
% dividimos pela magnitude do vetor para normalizá-lo
poleplane = cross(vec_diff, b)/norm(cross(vec_diff, b));

% converte para plano
cossdir2plane(poleplane)