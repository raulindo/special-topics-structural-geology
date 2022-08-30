% Esse script vai aplicar a equação de Cauchy
% entrada: plano (dipdir,dip e matriz de tensões)
% no caso, como a matriz é simétrica, apenas 6 elementos são necessários

xx = 02 ; xy = 01 ; xz = 05;
yx = xy ; yy = 03 ; yz = 04;
zx = xz ; zy = yz ; zz = 06;

stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
dipdir = 270;
dip = 45;

pole = plane2cossdir(dipdir, dip, false); % o resultado é um vetor do polo 1x3
pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1

s = stress_matrix*pole; % esse é o vetor tensão da matriz de stress no plano dado
fprintf('O vetor total tração [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
fprintf('A magnitude do vetor tração é %.2f\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
% transforma o vetor tração em atitude novamente
cossdir2line(s);


% tensão normal sobre o plano
mag_sn = abs(dot(s,pole)); % calcula a magntude da tensão normal sobre o plano
fprintf('A magnitude do vetor normal sobre o plano é %.2f\n', mag_sn);
snvetor = pole*mag_sn; % a orientação do vetor normal sobre o plano é o próprio polo multiplicado pela magnitude;
fprintf('O vetor total tração [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
% transforma o vetor tensão normal ao plano em atitude novamente
cossdir2line(snvetor); % essa é a linha do polo do plano
