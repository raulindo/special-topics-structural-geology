% Define figure properties
x0=300;
y0=300;
width=1000;
height=500;
set(gcf,'position',[x0,y0,width,height])

% Cisalhamento simples (F1) seguido de cisalhamento Puro (F2):
Simple_Shear = [1 tand(60); 0 1]; % F1
Pure_Shear = [2 0; 0 1/2]; % F2
% Assim a matriz de transform final sera F2xF1
F  = Pure_Shear*Simple_Shear; % F2xF1
det(F)
fprintf('O determinante da Matriz de Transformacao e %0.2f\n', det(F))

% define a square
Xs = [-2, 2, 2, -2, -2];
Ys = [2, 2, -2, -2, 2];
% plot a square
subplot(1,2,1)
plot(Xs, Ys, 'b-', 'LineWidth', 2);
hold on;
grid on;

% Transform coordinates Square
xs = []; %cria vetor vazio para guardar novas coordenadas x
ys = []; %cria vetor vazio para guardar novas coordenadas y

% iteracao de cada ponto (X,Y) para deformacao por Matriz de Transf
for i = 1:length(Xs)
    % cria vetor com par (X,Y)
    v = [[Xs(i)], [Ys(i)]];
    % assegura que será uma matriz coluna (1,2)
    xy_old = reshape(v, [2,1]); 
    % calcula vetor com novas posicoes
    xy_new = F*xy_old;
    % guarda novas posicoes em vetor para plot
    xs(i) = xy_new(1);
    ys(i) = xy_new(2);
end
% plot deformed square
plot(xs, ys, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-12 12])
ylim([-12 12]) 
% legend square
legend({'Initial State','Deformed State'},'Location','northeast')
%-------------------------------------------------------------
% define circle
z = 0:0.01:4;
z = z*pi;
Xc=2*cos(z);
Yc=2*sin(z);
% plot circle
subplot(1,2,2)
plot (Xc,Yc,'b','LineWidth', 2);
hold on;

% Transform coordinates Square
xc = []; %cria vetor vazio para guardar novas coordenadas x
yc = []; %cria vetor vazio para guardar novas coordenadas y

% iteracao de cada ponto (X,Y) para deformacao por Matriz de Transf
for i = 1:length(Xc)
    % cria vetor com par (X,Y)
    v = [[Xc(i)], [Yc(i)]];
    % assegura que será uma matriz coluna (1,2)
    xy_old = reshape(v, [2,1]); 
    % calcula vetor com novas posicoes
    xy_new = F*xy_old;
    % guarda novas posicoes em vetor para plot
    xc(i) = xy_new(1);
    yc(i) = xy_new(2);
end
% plot deformed square
plot(xc, yc, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-12 12])
ylim([-12 12]) 
% legend square
legend({'Initial State','Deformed State'},'Location','northeast')
grid on;
