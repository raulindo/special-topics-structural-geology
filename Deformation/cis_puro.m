% Define figure properties
x0=300;
y0=300;
width=1000;
height=500;
set(gcf,'position',[x0,y0,width,height])

% Define Transformation Matrix
a = 2;
b = 0;
c = 0;
d = 1/a;

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
xs = 2*a*Xs + 0.5*b*Ys;
ys = 2*c*Xs + 0.5*d*Ys;
plot(xs, ys, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-10 10])
ylim([-10 10]) 
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
xc = 2*a*Xc + 2*b*Yc;
yc = 0.5*c*Xc + 0.5*d*Yc;
plot(xc, yc, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-10 10])
ylim([-10 10]) 
grid on;
% legend circle
legend({'Initial State','Deformed State'},'Location','northeast')


