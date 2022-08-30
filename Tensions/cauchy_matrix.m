% Esse script vai aplicar a equa��o de Cauchy
% entrada: plano (dipdir,dip e matriz de tens�es)
% no caso, como a matriz � sim�trica, apenas 6 elementos s�o necess�rios

xx = 02 ; xy = 01 ; xz = 05;
yx = xy ; yy = 03 ; yz = 04;
zx = xz ; zy = yz ; zz = 06;

stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
dipdir = 270;
dip = 45;

pole = plane2cossdir(dipdir, dip, false); % o resultado � um vetor do polo 1x3
pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1

s = stress_matrix*pole; % esse � o vetor tens�o da matriz de stress no plano dado
fprintf('O vetor total tra��o [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
fprintf('A magnitude do vetor tra��o � %.2f\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
% transforma o vetor tra��o em atitude novamente
cossdir2line(s);


% tens�o normal sobre o plano
mag_sn = abs(dot(s,pole)); % calcula a magntude da tens�o normal sobre o plano
fprintf('A magnitude do vetor normal sobre o plano � %.2f\n', mag_sn);
snvetor = pole*mag_sn; % a orienta��o do vetor normal sobre o plano � o pr�prio polo multiplicado pela magnitude;
fprintf('O vetor total tra��o [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
% transforma o vetor tens�o normal ao plano em atitude novamente
cossdir2line(snvetor); % essa � a linha do polo do plano
