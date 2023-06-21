% Define figure properties
x0=300;
y0=300;
width=1000;
height=500;
set(gcf,'position',[x0,y0,width,height])

% Define Transformation Matrix
a = 1;
b = 1;
c = 0;
d = 1;

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
xs = (Xs + 2*Ys);
ys = Ys;
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
xc = Xc+2*Yc;
yc = Yc;
plot(xc, yc, 'r-', 'LineWidth', 2);
% change figure aspect ratio
pbaspect([2 2 1])
%Specify axis limits
xlim([-7 7])
ylim([-7 7]) 
grid on;
% legend circle
legend({'Initial State','Deformed State'},'Location','northeast')