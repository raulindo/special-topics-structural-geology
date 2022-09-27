% Define figure properties
x0=300;
y0=300;
width=1000;
height=500;
set(gcf,'position',[x0,y0,width,height])

% Define Transformation Matrix
a = 0.8;
b = 0.2;
c = 0.2;
d = 0.5;

F = [a b; c d];
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
xs = a*Xs + b*Ys;
ys = c*Xs + d*Ys;
plot(xs, ys, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-7 7])
ylim([-7 7]) 
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
xc = a*Xc + b*Yc;
yc = c*Xc + d*Yc;
plot(xc, yc, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-7 7])
ylim([-7 7]) 
grid on;
% legend circle
legend({'Initial State','Deformed State'},'Location','northeast')