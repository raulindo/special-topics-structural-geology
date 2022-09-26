% plot a square
X = [-2, 2, 2, -2, -2];
Y = [2, 2, -2, -2, 2];

plot(X, Y, 'b-', 'LineWidth', 1);
%Specify axis limits
xlim([-4 4])
ylim([-4 4])
axis equal
grid on;
hold on;

% Define Transformation Matrix
a = 1;
b = 1;
c = 0;
d = 1;

F = [a b; c d]
%det(F)
fprintf('O determinante da Matriz de Transformação é %0.2f\n', det(F))

% Transform coordinates
x = a*X + b*Y;
y = c*X + d*Y;


plot(x, y, 'r-', 'LineWidth', 1);
legend({'Initial State','Deformed State'},'Location','northeast')