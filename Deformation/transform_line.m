% fa�a script utilizando a matriz de transforma��o de coordenadas para
% calcular o estiramento (comprimento final / comprimento inicial), a
% orienta��o final e avaria��o angular de uma linha

% linha inicial em atitude geol�gica 020,40 (trend,plunge)
trend = 020;
plunge = 40;

% Converte a linha para cossenos diretores
fprintf('Os cossenos diretores da linha s�o:\n')
line = line2cossdir(trend,plunge,true);
fprintf('\n-----------------------\n')

% Define a transformation matriz (3D)
F = [1 -0.8 0;
     0 1 0;
     0 0 1];
 
% Transforma a linha 
line2 = F*line;

% Calcula a varia��o angular entre as duas linhas utilizando prod escalar
angle = acosd(dot(line,line2)/((abs(norm(line)))*(abs(norm(line2)))));
fprintf('- A varia��o angular � de: %0.2f�\n', angle)

% Calcula o estiramento (comprimento final/comprimento inicial)
estiramento = (abs(norm(line2)))/(abs(norm(line)));
fprintf('- O estiramento � de: S=%0.4f\n', estiramento)

% elongation = (lf-li)/li
elongation = ((abs(norm(line2))) - (abs(norm(line))))/(abs(norm(line)));
fprintf('- O elongamento � de: e=%0.4f\n', elongation)

% Calcula a orienta��o geol�gica da linha transformada
fprintf('-----------------------\n')
% fun��o de convers�o de cossenos diretores para atitude geologica
cossdir2line(line2);