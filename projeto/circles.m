angles = linspace(0, 2*pi, 500);
radius = 20;
CenterX = 50;
CenterY = 40;

X = [];
Y = [];

for ix=1:5
    X{ix} = radius * cos(angles) + (CenterX+2*radius*ix);
    Y{ix} = radius * sin(angles) + CenterY;
end

ix = 1;
for iy=6:10
    X{iy} = radius * cos(angles) + (CenterX+2*radius*ix);
    Y{iy} = radius * sin(angles) + CenterY+2*radius;
    ix = ix+1;
end

% -----------------------------------
% PLOT UNDEFORMED
subplot(3,1,1);
for ix=1:10
    hold on;
    plot(X{ix}, Y{ix}, 'b-', 'LineWidth', 2)
    hold on;
end
hold off;
grid on;
axis equal;
xlabel('X', 'FontSize', 14);
ylabel('Y', 'FontSize', 14);

% ------------------------------------- 
% Cisalhamento Puro
% ------------------------------------- 

kx = 1.5;
cp = [[kx 0],
      [0 kx/2]];

Xcompact = [];
Ycompact = [];

for i=1:10
    Xcompact{i} = kx*X{i};
    Ycompact{i} = (1/kx)*Y{i};
end
% Plot Compact - Cisalhamento Puro
subplot(3,1,2)
for i=1:10
    hold on;
    plot(Xcompact{i}, Ycompact{i}, 'g-', 'LineWidth', 2)
    hold on;
end
hold off;
grid on;
axis equal;
xlabel('X', 'FontSize', 14);
ylabel('Y', 'FontSize', 14);

% ------------------------------------------
% Cisalhamento Simples
% ------------------------------------------

ang_cisalhante = 45; % angulo de cisalhamento em graus
gamma = tand(ang_cisalhante);

cs = [[1 gamma],
      [0 1]];

Xdeformed = [];
Ydeformed = [];

for i=1:10
    Xdeformed{i} = Xcompact{i}+2*Ycompact{i};
    Ydeformed{i} = Ycompact{i};
end

% Plot Cisalhamento Simples
subplot(3,1,3)
for i=1:10
    hold on;
    plot(Xdeformed{i}, Ydeformed{i}, 'r-', 'LineWidth', 2)
    hold on;
end
hold off;
grid on;
axis equal;
xlabel('X', 'FontSize', 14);
ylabel('Y', 'FontSize', 14);
%ylim([-100,100])

